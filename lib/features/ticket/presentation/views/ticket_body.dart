import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/core/utils/app_connectivity.dart';
import 'package:orange_bay/core/widgets/custom_app_bar.dart';
import 'package:orange_bay/core/widgets/custom_button.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/features/app_manager/app_manager_state.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/widgets/custom_text.dart';
import 'package:orange_bay/features/ticket/manager/ticket_manager_cubit.dart';
import 'package:orange_bay/features/ticket/manager/ticket_manager_state.dart';
import 'package:orange_bay/models/cruises_response.dart';
import 'package:orange_bay/models/nationalities_response.dart';
import 'package:orange_bay/models/ticket.dart';
import 'package:orange_bay/models/tickets_response.dart';
import 'package:orange_bay/models/tour_guides_response.dart';

class TicketBody extends StatefulWidget {
  const TicketBody({super.key});

  @override
  State<TicketBody> createState() => _TicketBodyState();
}

class _TicketBodyState extends State<TicketBody> {
  final cubit = TicketManagerCubit();

  @override
  void initState() {
    super.initState();
    cubit.getTickets();
    cubit.getTicketCruises();
    cubit.getNationalities();
    cubit.getTicketTourGuide();
    checkBluetooth();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<TicketManagerCubit, TicketManagerState>(
        listener: (context, state) {
          if (state is GetOrderDetails) {
            onTicketBooked();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 15.w,
          ),
          child: ListView(
            children: [
              const CustomAppBar(text: 'Buy Ticket'),
              SizedBox(
                height: 20.h,
              ),
              const CustomText(text: "Tour Guide"),
              BlocBuilder<TicketManagerCubit, TicketManagerState>(
                buildWhen: (previous, current) =>
                    current is ListSelect || current is GetTicketTourGuides,
                builder: (context, state) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: DropdownButton<TourGuidesResponse>(
                      isExpanded: true,
                      value: cubit.tourGuideValue,
                      hint: Text(
                        "Select Tour Guide",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppColors.grey,
                          fontSize: 18.sp,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainOrange,
                      ),
                      iconSize: 24.r,
                      elevation: 16,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                      underline: const SizedBox(),
                      onChanged: (TourGuidesResponse? newValue) {
                        cubit.tourGuideValue = newValue!;
                        cubit.onListSelect();
                      },
                      items: cubit.tourGuideItems
                          .map<DropdownMenuItem<TourGuidesResponse>>(
                              (TourGuidesResponse value) {
                        return DropdownMenuItem<TourGuidesResponse>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              const CustomText(text: "Nationality"),
              BlocBuilder<TicketManagerCubit, TicketManagerState>(
                buildWhen: (previous, current) =>
                    current is ListSelect || current is GetNationalities,
                builder: (context, state) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: DropdownButton<NationalitiesResponse>(
                      isExpanded: true,
                      value: cubit.nationalityValue,
                      hint: Text(
                        "Select Nationality",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppColors.grey,
                          fontSize: 18.sp,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainOrange,
                      ),
                      iconSize: 24.r,
                      elevation: 16,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                      underline: const SizedBox(),
                      onChanged: (NationalitiesResponse? newValue) {
                        cubit.nationalityValue = newValue!;
                        cubit.onListSelect();
                      },
                      items: cubit.nationalityItems
                          .map<DropdownMenuItem<NationalitiesResponse>>(
                        (NationalitiesResponse value) {
                          return DropdownMenuItem<NationalitiesResponse>(
                            value: value,
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              const CustomText(text: "Cruise"),
              BlocBuilder<TicketManagerCubit, TicketManagerState>(
                buildWhen: (previous, current) =>
                    current is ListSelect || current is GetTicketCruises,
                builder: (context, state) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: DropdownButton<CruisesResponse>(
                      isExpanded: true,
                      value: cubit.cruiseValue,
                      hint: Text(
                        "Select Cruise",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppColors.grey,
                          fontSize: 18.sp,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainOrange,
                      ),
                      iconSize: 24.r,
                      elevation: 16,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                      underline: const SizedBox(),
                      onChanged: (CruisesResponse? newValue) {
                        cubit.cruiseValue = newValue!;
                        cubit.onListSelect();
                      },
                      items: cubit.cruiseItems
                          .map<DropdownMenuItem<CruisesResponse>>(
                        (CruisesResponse value) {
                          return DropdownMenuItem<CruisesResponse>(
                            value: value,
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomText(text: "Tickets"),
              BlocBuilder<TicketManagerCubit, TicketManagerState>(
                buildWhen: (previous, current) =>
                    current is ListSelect || current is GetTickets,
                builder: (context, state) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.blue)),
                    child: DropdownButton<TicketsResponse>(
                      isExpanded: true,
                      value: cubit.ticketValue,
                      hint: Text(
                        "Select Tickets",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppColors.grey,
                          fontSize: 18.sp,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainOrange,
                      ),
                      iconSize: 24.r,
                      elevation: 16,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                      underline: const SizedBox(),
                      onChanged: (TicketsResponse? newValue) {
                        cubit.ticketValue = newValue!;
                        if (cubit.orderTickets.isEmpty) {
                          cubit.orderTickets.add(
                            Ticket(
                              quantity: 1,
                              price: newValue.price,
                              id: newValue.id,
                              title: newValue.name,
                            ),
                          );
                          cubit.totalPrice += newValue.price;
                          cubit.onListSelect();
                        } else {
                          bool found = false;
                          for (int i = 0; i < cubit.orderTickets.length; i++) {
                            if (newValue.id == cubit.orderTickets[i].id) {
                              found = true;
                              break;
                            }
                          }
                          if (!found) {
                            cubit.orderTickets.add(
                              Ticket(
                                quantity: 1,
                                price: newValue.price,
                                id: newValue.id,
                                title: newValue.name,
                              ),
                            );
                            cubit.totalPrice += newValue.price;
                            cubit.onListSelect();
                          }
                        }
                      },
                      items: cubit.ticketsItems
                          .map<DropdownMenuItem<TicketsResponse>>(
                        (TicketsResponse value) {
                          return DropdownMenuItem<TicketsResponse>(
                            value: value,
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              ticketItemBuilder(),
              SizedBox(height: 30.h),
              Divider(
                color: AppColors.primary,
                thickness: 2.h,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: textTheme.titleLarge!.copyWith(
                      color: AppColors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  BlocBuilder<TicketManagerCubit, TicketManagerState>(
                    buildWhen: (previous, current) =>
                        current is ListSelect || current is QuantityChange,
                    builder: (context, state) {
                      return Text(
                        "${cubit.totalPrice}\$",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppColors.black,
                          fontSize: 18.sp,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              BlocBuilder<AppManagerCubit, AppManagerState>(
                buildWhen: (previous, current) => current is LoadingChange,
                builder: (context, state) {
                  return cubit.loading
                      ? LinearProgressIndicator(
                          color: AppColors.mainOrange,
                          borderRadius: BorderRadius.circular(16.r),
                    minHeight: 15.h,
                        )
                      : CustomButton(
                          backgroundColor: AppColors.mainOrange,
                          text: 'Confirm',
                          textColor: Colors.white,
                          onPressed: () {
                            cubit.postOrder(context);
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTicketBooked() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      title: 'Do you want receipt?',
      btnOkOnPress: () async {
        await cubit.getDevices();
        await cubit.printerService.connect(cubit.devices[0]);
        int i = 0;
        for (var element in cubit.ordersResponseItems) {
          for (var element in element.serialNumbers) {
            await cubit.printerService.printReceipt(
              "Order number : ${cubit.orderId}\nSerial number : ${element.serialNumber}\nTour Guide : ${element.tourGuide}\nNationality : ${element.nationality}\nTicket title : ${element.ticketTitle}\nPrice : ${element.price}\$\n",
              "------------------------------\n\n",
              cubit.qrCodes[i],
            );
            i++;
          }
        }
        await cubit.printerService.disconnect().then((_) {
          onTicketBookedSuccess();
        });
      },
      btnOkText: 'OK',
    ).show();
  }

  void onTicketBookedSuccess() {
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.success,
      title: "Ticket Booked",
      btnOkText: "OK",
      btnOkOnPress: () {
        cubit.orderTickets.clear();
        cubit.totalPrice = 0;
        cubit.ticketValue = null;
        cubit.tourGuideValue = null;
        cubit.cruiseValue = null;
        cubit.nationalityValue = null;
        cubit.onListSelect();
      },
    ).show();
  }

  Future<void> checkBluetooth() async {
    if (!await AppConnectivity.checkBluetooth()) {
      AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        dialogType: DialogType.warning,
        title: "Bluetooth is not available",
        btnOkText: "OK",
        btnOkOnPress: () {},
      ).show();
    }
  }

  Widget ticketItemBuilder() {
    return BlocBuilder<TicketManagerCubit, TicketManagerState>(
      buildWhen: (previous, current) => current is ListSelect,
      builder: (context, state) {
        return ListView.builder(
          itemCount: cubit.orderTickets.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 80.h,
              padding: EdgeInsets.all(15.r),
              margin: EdgeInsets.only(
                bottom: 15.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.grey,
                  width: 2.5.w,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.totalPrice -= cubit.orderTickets[index].price *
                            cubit.orderTickets[index].quantity;
                        cubit.orderTickets.removeAt(index);
                        cubit.onListSelect();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Icon(
                        Icons.delete,
                        size: 30.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      cubit.orderTickets[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.orderTickets[index].quantity++;
                        cubit.totalPrice += cubit.orderTickets[index].price;
                        cubit.onQuantityChange();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  BlocBuilder<TicketManagerCubit, TicketManagerState>(
                    buildWhen: (previous, current) => current is QuantityChange,
                    builder: (context, state) {
                      return Text(
                        "${cubit.orderTickets[index].quantity}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cubit.orderTickets[index].quantity > 1) {
                          cubit.orderTickets[index].quantity--;
                          cubit.totalPrice -= cubit.orderTickets[index].price;
                          cubit.onQuantityChange();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 30.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
