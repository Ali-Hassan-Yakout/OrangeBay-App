import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';
import 'package:orange_bay/features/cashier/manager/cashier_manager_cubit.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/cashier_home_body.dart';

class CashierHomeView extends StatefulWidget {
  const CashierHomeView({super.key});

  @override
  State<CashierHomeView> createState() => _CashierHomeViewState();
}

class _CashierHomeViewState extends State<CashierHomeView> {
  final cubit = CashierManagerCubit();

  @override
  void initState() {
    super.initState();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Image.asset(
                  AssetData.logo,
                  height: 40.h,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  logOut(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.mainOrange,
                  size: 30.r,
                ),
              ),
            ],
          ),
        ),
        body: const CashierHomeBody(),
      ),
    );
  }

  void logOut(BuildContext context) {
    PreferenceUtils.setString(PrefKeys.accessToken, "");
    PreferenceUtils.setString(PrefKeys.userName, "");
    GoRouter.of(context).pushReplacement(AppRouter.login);
  }
}
