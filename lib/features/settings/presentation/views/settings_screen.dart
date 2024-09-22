import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_toast.dart';
import 'package:orange_bay/core/utils/shared_preferences.dart';
import 'package:orange_bay/core/widgets/custom_button.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final baseUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    baseUrlController.text = PreferenceUtils.getString(
        PrefKeys.baseUrl, "https://org-bay.runasp.net/api/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.orange,
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25.sp,
            color: AppColors.mainOrange,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Base URL",
              style: TextStyle(
                fontSize: 20.r,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            AppTextField(
              controller: baseUrlController,
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {
                saveBaseUrl();
              },
              backgroundColor: AppColors.mainOrange,
              text: "Apply",
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveBaseUrl() async {
    try {
      await PreferenceUtils.setString(PrefKeys.baseUrl, baseUrlController.text);
      onSaveBaseUrlSuccess();
    } catch (e) {
      AppToast.displayToast(message: e.toString(), isError: true);
    }
  }

  void onSaveBaseUrlSuccess() {
    AppToast.displayToast(message: "Base URL Applied", isError: false);
    AppDio.setBaseUrl(baseUrlController.text);
    GoRouter.of(context).pop();
  }
}
