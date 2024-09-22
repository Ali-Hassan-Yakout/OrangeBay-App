import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_connectivity.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_permissions.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await AppPermissions.requestPermissions();
  AppDio.init();
  AppConnectivity.init();
  runApp(const OrangeBayCashless());
}

class OrangeBayCashless extends StatelessWidget {
  const OrangeBayCashless({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => AppManagerCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            textTheme: GoogleFonts.manropeTextTheme(),
            primaryColor: AppColors.blue,
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
