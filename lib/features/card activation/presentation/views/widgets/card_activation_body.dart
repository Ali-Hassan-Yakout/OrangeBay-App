import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_print.dart';
import 'package:orange_bay/core/utils/app_router.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/core/widgets/custom_button.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/all_text_fields.dart';

class CardActivationBody extends StatefulWidget {
  final String uid;

  const CardActivationBody({super.key, required this.uid});

  @override
  State<CardActivationBody> createState() => _CardActivationBodyState();
}

class _CardActivationBodyState extends State<CardActivationBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AppPrint _printerService = AppPrint();
  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _selectedDevice;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 15.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(text: 'Card activation'),
                SizedBox(
                  height: 22.h,
                ),
                Form(
                  key: formKey,
                  child: AllTextFields(uid: widget.uid),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              onPressed: () {
                cardActivate();
              },
              backgroundColor: AppColors.mainOrange,
              text: 'Confirm',
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.admin);
              },
              backgroundColor: AppColors.grey,
              text: 'Cancel',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void cardActivate() {
    if (!formKey.currentState!.validate()) return;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      title: 'Do you want receipt?',
      btnOkOnPress: () {
        showModalBottomSheet(
          context: context,
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              height: 200.h,
              width: double.infinity,
              padding: EdgeInsets.all(15.sp),
              alignment: Alignment.center,
              color: AppColors.greyBg,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _devices.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // _selectedDevice = _devices[index];
                      // _printerService.connect(_selectedDevice!);
                      // _printerService
                      //     .printReceipt(
                      //   "Welcome To Orange Bay 1 2 3 4 5 6 8\n9",
                      //   "Have a Nice Vacation Ali Hassan",
                      // )
                      //     .then((_) {
                      //   _printerService.disconnect();
                      //   onCardActivateSuccess();
                      // });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(_devices[index].name ?? 'Unknown'),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      btnCancelOnPress: () {
        onCardActivateSuccess();
      },
      btnOkText: 'OK',
      btnCancelText: 'Cancel',
    ).show();
  }

  void onCardActivateSuccess() {
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.success,
      title: "Card Activated Successfully",
      btnOkText: "OK",
      btnOkOnPress: () {
        GoRouter.of(context).pop();
      },
    ).show();
  }

  void getDevices() async {
    _devices = await _printerService.getBondedDevices();
    setState(() {});
  }
}
