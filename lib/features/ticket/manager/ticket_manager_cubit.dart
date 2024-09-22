import 'dart:convert';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_bay/core/utils/app_dio.dart';
import 'package:orange_bay/core/utils/app_endpoints.dart';
import 'package:orange_bay/core/utils/app_print.dart';
import 'package:orange_bay/core/utils/app_toast.dart';
import 'package:orange_bay/features/app_manager/app_manager_cubit.dart';
import 'package:orange_bay/features/ticket/manager/ticket_manager_state.dart';
import 'package:orange_bay/models/cruises_response.dart';
import 'package:orange_bay/models/nationalities_response.dart';
import 'package:orange_bay/models/orders_response.dart';
import 'package:orange_bay/models/ticket.dart';
import 'package:orange_bay/models/tickets_response.dart';
import 'package:orange_bay/models/tour_guides_response.dart';

class TicketManagerCubit extends Cubit<TicketManagerState> {
  TicketManagerCubit() : super(TicketManagerInitial());
  TourGuidesResponse? tourGuideValue;
  List<TourGuidesResponse> tourGuideItems = [];
  NationalitiesResponse? nationalityValue;
  List<NationalitiesResponse> nationalityItems = [];
  CruisesResponse? cruiseValue;
  List<CruisesResponse> cruiseItems = [];
  TicketsResponse? ticketValue;
  List<TicketsResponse> ticketsItems = [];
  List<Ticket> orderTickets = [];
  List<OrdersResponse> ordersResponseItems = [];
  List<Map> ordersRequestItems = [];
  List<String> qrCodes = [];
  double totalPrice = 0;
  int orderId = 0;
  final AppPrint printerService = AppPrint();
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;
  bool loading = false;

  Future<void> getTickets() async {
    try {
      final response = await AppDio.get(endPoint: AppEndpoints.tickets);
      if (response.data != null) {
        response.data.forEach((v) {
          ticketsItems.add(TicketsResponse.fromJson(v));
        });
      }
      emit(GetTickets());
    } catch (e) {
      AppToast.displayToast(
        message: 'Get Tickets Failure',
        isError: true,
      );
    }
  }

  Future<void> getTicketCruises() async {
    try {
      final response = await AppDio.get(endPoint: AppEndpoints.cruises);
      if (response.data != null) {
        response.data.forEach((v) {
          cruiseItems.add(CruisesResponse.fromJson(v));
        });
      }
      emit(GetTicketCruises());
    } catch (e) {
      AppToast.displayToast(
        message: 'Get Cruises Failure',
        isError: true,
      );
    }
  }

  Future<void> getNationalities() async {
    try {
      final response = await AppDio.get(endPoint: AppEndpoints.nationalities);
      if (response.data != null) {
        response.data.forEach((v) {
          nationalityItems.add(NationalitiesResponse.fromJson(v));
        });
      }
      emit(GetNationalities());
    } catch (e) {
      AppToast.displayToast(
        message: 'Get Nationalities Failure',
        isError: true,
      );
    }
  }

  Future<void> getTicketTourGuide() async {
    try {
      final response = await AppDio.get(endPoint: AppEndpoints.tourGuides);
      if (response.data != null) {
        response.data.forEach((v) {
          tourGuideItems.add(TourGuidesResponse.fromJson(v));
        });
      }
      emit(GetTicketTourGuides());
    } catch (e) {
      AppToast.displayToast(
        message: 'Get Tour Guides Failure',
        isError: true,
      );
    }
  }

  Future<void> postOrder(BuildContext context) async {
    if (nationalityValue != null &&
        orderTickets.isNotEmpty &&
        cruiseValue != null &&
        tourGuideValue != null) {
      loading = true;
      BlocProvider.of<AppManagerCubit>(context).onLoadingChange();
      ordersRequestItems.clear();
      for (var element in orderTickets) {
        for (int i = 0; i < element.quantity; i++) {
          ordersRequestItems.add(
            {
              'ticketId': element.id,
              'price': element.price,
            },
          );
        }
      }
      final response = await AppDio.post(
        endPoint: AppEndpoints.orders,
        body: {
          "nationalityId": nationalityValue!.id,
          "cruiseId": cruiseValue!.id,
          "tourGuideId": tourGuideValue!.id,
          "orderItems": ordersRequestItems,
        },
      );
      orderId = int.parse(response.data.toString().split(" ")[5]);
      getOrder();
    } else {
      AppToast.displayToast(
        message: "Options can't be blank",
        isError: true,
      );
    }
    loading = false;
    BlocProvider.of<AppManagerCubit>(context).onLoadingChange();
  }

  Future<void> getOrder() async {
    ordersResponseItems.clear();
    qrCodes.clear();
    final response =
        await AppDio.get(endPoint: "${AppEndpoints.orders}/$orderId");
    if (response.data != null) {
      response.data.forEach(
        (v) async {
          ordersResponseItems.add(OrdersResponse.fromJson(v));
        },
      );
      for (var element in ordersResponseItems) {
        for (var element in element.serialNumbers) {
          final String jsonData = jsonEncode(element.toJson());
          qrCodes.add(jsonData);
        }
      }
    }
    emit(GetOrderDetails());
  }

  Future<void> getDevices() async {
    devices.clear();
    devices = await printerService.getBondedDevices();
    emit(GetDevices());
  }

  void onListSelect() => emit(ListSelect());

  void onQuantityChange() => emit(QuantityChange());
}
