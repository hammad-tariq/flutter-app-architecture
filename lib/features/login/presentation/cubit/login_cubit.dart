import 'package:equatable/equatable.dart';
import '../../../../core/bloc/base_cubit.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(LoginInitialState());

  void authenticateUserApi() async {
    emit(LoginInProgressState());
    LoginRequest loginRequest =
        LoginRequest(email: "test@email.com", password: "test12345");
    // var loginResponse = await loginRepository.makeLoginRequest(loginRequest);
    //
    // loginResponse.fold((left) {
    //   // Failure
    //   emit(LoginFailureState(message: handleException(left)));
    // }, (right) {
    //   // Success.
    // });
    //
  }
}
