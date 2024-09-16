class RegisterManagerState {}

final class RegisterManagerInitial extends RegisterManagerState {}

final class RegisterSuccess extends RegisterManagerState {}

final class RegisterFailure extends RegisterManagerState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}
