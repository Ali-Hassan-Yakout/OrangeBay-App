import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:orange_bay/core/utils/app_connectivity.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_endpoints.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/features/login/manager/login_manager_state.dart';

class LoginManagerCubit extends Cubit<LoginManagerState> {
  LoginManagerCubit() : super(LoginManagerInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Map<String, dynamic> decodedToken = {};
  bool obscure = true;
  bool loading = false;

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading = true;
    BlocProvider.of<AppManagerCubit>(context).onLoadingChange();
    try {
      final response = await AppDio.post(
        endPoint: AppEndpoints.login,
        body: {
          "userName": emailController.text,
          "password": passwordController.text,
        },
      );
      await PreferenceUtils.setString(
        PrefKeys.accessToken,
        response.data['accessToken'],
      );
      await PreferenceUtils.setString(
        PrefKeys.userName,
        emailController.text,
      );
      decodedToken = JwtDecoder.decode(
        PreferenceUtils.getString(
          PrefKeys.accessToken,
        ),
      );
      emit(LoginSuccess());
    } catch (e) {
      if (await AppConnectivity.checkConnection()) {
        emit(LoginFailure("Invalid Credentials"));
      } else {
        emit(LoginFailure('Check Your internet!'));
      }
    }
    loading = false;
    BlocProvider.of<AppManagerCubit>(context).onLoadingChange();
  }
}
