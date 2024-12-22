import 'package:bloc/bloc.dart';
import 'package:fruitsecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:fruitsecommerce/features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
        (faliure) => emit(SignupFailure(message: faliure.message)),
        (userEntity) => emit(SignupSuccess(userEntity: userEntity))
    );
  }
}
