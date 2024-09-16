import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orange_bay/core/widgets/card_verification_view.dart';
import 'package:orange_bay/features/add%20and%20refund/presentation/views/add_money_view.dart';
import 'package:orange_bay/features/add%20and%20refund/presentation/views/refund_view.dart';
import 'package:orange_bay/features/admin/presentation/views/admin_home_view.dart';
import 'package:orange_bay/features/admin/presentation/views/card_info_view.dart';
import 'package:orange_bay/features/card%20activation/presentation/views/card_activation_view.dart';
import 'package:orange_bay/features/cashier/presentation/views/balance_view.dart';
import 'package:orange_bay/features/cashier/presentation/views/cartItems_view.dart';
import 'package:orange_bay/features/cashier/presentation/views/cashier_home_view.dart';
import 'package:orange_bay/features/cashier/presentation/views/transactions_history_view.dart';
import 'package:orange_bay/features/login/presentation/views/login_view.dart';
import 'package:orange_bay/features/register/presentation/views/register_view.dart';
import 'package:orange_bay/features/replacement_card/presentation/views/replacment_card_view.dart';
import 'package:orange_bay/features/ticket/presentation/views/ticket_view.dart';
import 'package:orange_bay/features/tour_guide_profit/presentation/views/tour_guide_profit_view.dart';
import 'package:orange_bay/features/transactions_history/presentation/views/admin_transactions_history_view.dart';

abstract class AppRouter {
  static const String login = "/";
  static const String register = "/register";
  static const String ticket = "/ticket";
  static const String admin = '/admin';
  static const String cardActivation = '/cardActivation';
  static const String tourGuideProfit = "/tourGuideProfit";
  static const String adminTransactionsHistoryAuth =
      '/adminTransactionsHistoryAuth';
  static const String adminTransactionsHistoryView =
      '/adminTransactionsHistoryView';

  static const String cardActivationView = '/cardActivationView';
  static const String addMoneyAuth = '/addCardAuth';
  static const String addMoneyView = '/addCardView';
  static const String refundAuth = '/refundAuth';
  static const String refundView = '/refundView';
  static const String cardInfoAuth = '/cardInfoAuth';
  static const String cardInfoView = '/cardInfoView';

  static const String cashier = '/cashier';
  static const String cartItems = '/cartItems';
  static const String verifyPayment = '/verifyPayment';
  static const String transactionHistory = '/transactionHistory';
  static const String balance = '/balance';
  static const String replacementCard = '/replacementCard';
  static const String replacementCardAuth = '/replacementCardAuth';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),
      GoRoute(
        path: register,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterView(),
      ),
      GoRoute(
        path: admin,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminHomeView(),
      ),
      GoRoute(
        path: ticket,
        builder: (BuildContext context, GoRouterState state) =>
            const TicketView(),
      ),
      GoRoute(
        path: tourGuideProfit,
        builder: (BuildContext context, GoRouterState state) =>
            const TourGuideProfitView(),
      ),
      GoRoute(
        path: cashier,
        builder: (BuildContext context, GoRouterState state) =>
            const CashierHomeView(),
      ),
      GoRoute(
        path: cardActivation,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: "مرر البطاقه ",
          newScreen: AppRouter.cardActivationView,
        ),
      ),
      GoRoute(
        path: adminTransactionsHistoryAuth,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: 'مرر البطاقه',
          newScreen: AppRouter.adminTransactionsHistoryView,
        ),
      ),
      GoRoute(
        path: adminTransactionsHistoryView,
        builder: (BuildContext context, GoRouterState state) =>
            const AdminTransactionsHistoryView(),
      ),
      GoRoute(
        path: replacementCardAuth,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: 'مرر البطاقه الجديده',
          newScreen: AppRouter.admin,
        ),
      ),
      GoRoute(
        path: replacementCard,
        builder: (BuildContext context, GoRouterState state) =>
            const ReplacementCardView(),
      ),
      GoRoute(
        path: cardActivationView,
        builder: (BuildContext context, GoRouterState state) {
          final String uid = state.extra as String;
          return CardActivationView(uid: uid);
        },
      ),
      GoRoute(
        path: addMoneyAuth,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: "مرر البطاقه ",
          newScreen: AppRouter.addMoneyView,
        ),
      ),
      GoRoute(
        path: addMoneyView,
        builder: (BuildContext context, GoRouterState state) =>
            const AddMoneyView(),
      ),
      GoRoute(
        path: refundAuth,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: "مرر البطاقه ",
          newScreen: AppRouter.refundView,
        ),
      ),
      GoRoute(
        path: refundView,
        builder: (BuildContext context, GoRouterState state) =>
            const RefundView(),
      ),
      GoRoute(
        path: cardInfoAuth,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: "مرر البطاقه ",
          newScreen: AppRouter.cardInfoView,
        ),
      ),
      GoRoute(
        path: cardInfoView,
        builder: (BuildContext context, GoRouterState state) =>
            const CardInfoView(),
      ),
      GoRoute(
        path: cartItems,
        builder: (BuildContext context, GoRouterState state) =>
            const CartItemsView(),
      ),
      GoRoute(
        path: verifyPayment,
        builder: (BuildContext context, GoRouterState state) =>
            const CardVerificationView(
          textMsg: 'قم بتمرير الكارت',
          newScreen: AppRouter.cashier,
        ),
      ),
      GoRoute(
        path: transactionHistory,
        builder: (BuildContext context, GoRouterState state) =>
            const TransactionsHistoryView(),
      ),
      GoRoute(
        path: balance,
        builder: (BuildContext context, GoRouterState state) =>
            const BalanceView(),
      ),
    ],
  );
}
