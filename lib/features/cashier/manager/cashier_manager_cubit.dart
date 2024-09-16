import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_endpoints.dart';
import 'package:orange_bay/features/cashier/manager/cashier_manager_state.dart';
import 'package:orange_bay/models/product_response.dart';

class CashierManagerCubit extends Cubit<CashierManagerState> {
  CashierManagerCubit() : super(CashierManagerInitial());

  List<ProductResponse> productItems = [];
  List<int> productItemCount = [];
  int cartItemsCount = 0;

  Future<void> getProducts() async {
    try {
      final response = await AppDio.get(endPoint: AppEndpoints.products);
      if (response.data != null) {
        response.data.forEach(
          (v) {
            productItems.add(ProductResponse.fromJson(v));
          },
        );
      }
      productItemCount = List.filled(productItems.length, 0);
      emit(GetProductSuccess());
    } catch (e) {
      emit(GetProductFailure(e.toString()));
    }
  }
}
