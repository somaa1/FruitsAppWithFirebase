import 'package:bloc/bloc.dart';
import 'package:fruitsecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:meta/meta.dart';

import '../../../domin/repos/auth_repo.dart';
import '../signup_cubit/signup_cubit.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((faliure) => emit(SigninFailure(message: faliure.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold((faliure) => emit(SigninFailure(message: faliure.message)),
        (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold((faliure) => emit(SigninFailure(message: faliure.message)),
            (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }
}
