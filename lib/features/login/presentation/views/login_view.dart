import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_nfc.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/app_toast.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/features/app_manager/app_manager_state.dart';
import 'package:orange_bay/features/login/manager/login_manager_cubit.dart';
import 'package:orange_bay/features/login/manager/login_manager_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final cubit = LoginManagerCubit();

  @override
  void initState() {
    super.initState();
    AppNfc appNfc = AppNfc();
    appNfc.checkNfcAvailability(context);
  }

  @override
  void dispose() {
    super.dispose();
    cubit.emailController.dispose();
    cubit.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginManagerCubit, LoginManagerState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            onLoginSuccess();
          } else if (state is LoginFailure) {
            AppToast.displayToast(state.errorMessage);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AssetData.logo,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 15.w,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 25.h,
                      left: 30.w,
                      right: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Form(
                      key: cubit.formKey,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(
                            "Email",
                            style: textTheme.titleLarge!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: cubit.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email required!";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.primary,
                            style: const TextStyle(color: AppColors.primary),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.primary,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Password",
                            style: textTheme.titleLarge!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          BlocBuilder<AppManagerCubit, AppManagerState>(
                            buildWhen: (previous, current) =>
                                current is ObscureChange,
                            builder: (context, state) {
                              return TextFormField(
                                controller: cubit.passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password required!";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: cubit.obscure,
                                cursorColor: AppColors.primary,
                                style:
                                    const TextStyle(color: AppColors.primary),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: AppColors.primary,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.obscure = !cubit.obscure;
                                      BlocProvider.of<AppManagerCubit>(context)
                                          .onObscureChange();
                                    },
                                    icon: Icon(
                                      cubit.obscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 30.h),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginSuccess() {
    String role = cubit.decodedToken[
        'http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
    if (role == "Admin") {
      GoRouter.of(context).pushReplacement(AppRouter.admin);
    } else if (role == "Employee") {
      GoRouter.of(context).pushReplacement(AppRouter.cashier);
    }
  }
}
