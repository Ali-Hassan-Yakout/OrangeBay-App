class CashierManagerState {}

final class CashierManagerInitial extends CashierManagerState {}

final class GetProductSuccess extends CashierManagerState {}

final class GetProductFailure extends CashierManagerState {
  final String errorMessage;

  GetProductFailure(this.errorMessage);
}
