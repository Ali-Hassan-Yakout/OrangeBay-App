import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/assets.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';
import 'package:orange_bay/features/admin/presentation/views/widgets/admin_home_body.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyGlobals().scaffoldKey,
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
      body: const AdminHomeBody(),
    );
  }

  void logOut(BuildContext context) {
    PreferenceUtils.setString(PrefKeys.accessToken, "");
    PreferenceUtils.setString(PrefKeys.userName, "");
    GoRouter.of(context).pushReplacement(AppRouter.login);
  }
}

MyGlobals myGlobals = MyGlobals();

class MyGlobals {
  GlobalKey? _scaffoldKey;

  MyGlobals() {
    _scaffoldKey = GlobalKey();
  }

  GlobalKey get scaffoldKey => _scaffoldKey!;
}
