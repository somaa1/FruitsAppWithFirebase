import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitsecommerce/constants.dart';
import 'package:fruitsecommerce/core/Service/data_service.dart';
import 'package:fruitsecommerce/core/Service/firebase_auth_service.dart';
import 'package:fruitsecommerce/core/Service/shared_prefrences_singleton.dart';
import 'package:fruitsecommerce/core/errors/Failures.dart';
import 'package:fruitsecommerce/core/errors/exceptions.dart';
import 'package:fruitsecommerce/core/utils/backend_endpoint.dart';
import 'package:fruitsecommerce/features/auth/data/models/user_model.dart';
import 'package:fruitsecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:fruitsecommerce/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        message: "An error occurred while creating",
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await SaveUserData( user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(e.message));
    } catch (e) {

      return left(ServerFailure("an error occurred while  signing in"));

    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);

      var userEntity = UserModel.fromFireBaseUser(user);
      if (isUserExist) {
        await getUserData(uid: userEntity.uId);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);

      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(
        'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      ));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      // محاولة تسجيل الدخول باستخدام Facebook عبر Firebase
      user = await firebaseAuthService.signInWithFacebook();
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);

      var userEntity = UserModel.fromFireBaseUser(user);
      if (isUserExist) {
        await getUserData(uid: userEntity.uId);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      // تسجيل الخطأ وعرض رسالة عامة عند الفشل غير المتوقع
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(
        'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      ));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.addUserData, docuementId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future SaveUserData({required UserEntity user}) async{
  var jsonData=jsonEncode(UserModel.fromEntity(user).toMap());

    await Prefs.setString(kUserData, jsonData);
  }
}
