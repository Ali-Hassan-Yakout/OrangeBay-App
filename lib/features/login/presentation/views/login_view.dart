import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_nfc.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/app_toast.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
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
            AppToast.displayToast(
              message: state.errorMessage,
              isError: true,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.settings);
                },
                icon: Icon(
                  Icons.settings,
                  size: 40.r,
                  color: AppColors.mainOrange,
                ),
              )
            ],
          ),
          body: Column(
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
                        AppTextField(
                          controller: cubit.emailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Email required!";
                            }
                            return null;
                          },
                          hint: "Please Enter Email",
                          type: TextInputType.emailAddress,
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
                            return AppTextField(
                              controller: cubit.passwordController,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Password required!";
                                }
                                return null;
                              },
                              hint: "Please Enter Password",
                              type: TextInputType.visiblePassword,
                              isPassword: cubit.obscure,
                              maxLine: 1,
                              suffix: IconButton(
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
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              cubit.login(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child:
                                BlocBuilder<AppManagerCubit, AppManagerState>(
                              buildWhen: (previous, current) =>
                                  current is LoadingChange,
                              builder: (context, state) {
                                return cubit.loading
                                    ? SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "Sign In",
                                        style: textTheme.titleLarge!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                              },
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
