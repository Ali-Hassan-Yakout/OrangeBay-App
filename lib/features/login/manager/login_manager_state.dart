class LoginManagerState {}

final class LoginManagerInitial extends LoginManagerState {}

final class LoginSuccess extends LoginManagerState {}

final class LoginFailure extends LoginManagerState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
