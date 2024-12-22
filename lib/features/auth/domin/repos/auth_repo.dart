import 'package:dartz/dartz.dart';
import 'package:fruitsecommerce/core/errors/Failures.dart';
import 'package:fruitsecommerce/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
  //AuthRepo
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});
  Future SaveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uid});

}
