import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/app_toast.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/features/app_manager/app_manager_state.dart';
import 'package:orange_bay/features/register/manager/register_manager_cubit.dart';
import 'package:orange_bay/features/register/manager/register_manager_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final cubit = RegisterManagerCubit();

  @override
  void dispose() {
    super.dispose();
    cubit.firstNameController.dispose();
    cubit.lastNameController.dispose();
    cubit.emailController.dispose();
    cubit.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterManagerCubit, RegisterManagerState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            onRegisterSuccess();
          } else if (state is RegisterFailure) {
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
                    padding: EdgeInsets.all(15.r),
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
                            "First name",
                            style: textTheme.titleLarge!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: cubit.firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name required!";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            cursorColor: AppColors.primary,
                            style: const TextStyle(color: AppColors.primary),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outlined,
                                color: AppColors.primary,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16.sp,
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
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Last name",
                            style: textTheme.titleLarge!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: cubit.lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name required!";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            cursorColor: AppColors.primary,
                            style: const TextStyle(color: AppColors.primary),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outlined,
                                color: AppColors.primary,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16.sp,
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
                          ),
                          SizedBox(height: 30.h),
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
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.primary,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16.sp,
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
                          TextFormField(
                            controller: cubit.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password required!";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            cursorColor: AppColors.primary,
                            style: const TextStyle(color: AppColors.primary),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.primary,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16.sp,
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
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Confirm Password",
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Confirmation required!";
                                  } else if (value !=
                                      cubit.passwordController.text) {
                                    return "Those password didn't match";
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
                                  errorStyle: TextStyle(
                                    fontSize: 16.sp,
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
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.register();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                "Sign Up",
                                style: textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.login);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          )
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

  void onRegisterSuccess() {
    AppToast.displayToast("Account Created");
    GoRouter.of(context).pushReplacement(AppRouter.login);
  }
}
