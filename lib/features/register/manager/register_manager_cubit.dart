import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_bay/core/utils/app_connectivity.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_endpoints.dart';
import 'package:orange_bay/features/register/manager/register_manager_state.dart';

class RegisterManagerCubit extends Cubit<RegisterManagerState> {
  RegisterManagerCubit() : super(RegisterManagerInitial());

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      await AppDio.post(
        endPoint: AppEndpoints.register,
        body: {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      emit(RegisterSuccess());
    } catch (e) {
      if (await AppConnectivity.checkConnection()) {
        emit(RegisterFailure("Invalid Credentials"));
      } else {
        emit(RegisterFailure('Check Your internet!'));
      }
    }
  }
}
