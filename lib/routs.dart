import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/middleware/mymiddleware.dart';
import 'package:e_comerse_app/view/screens/address/add.dart';
import 'package:e_comerse_app/view/screens/address/edit.dart';
import 'package:e_comerse_app/view/screens/address/view.dart';
import 'package:e_comerse_app/view/screens/auth/forget%20Password/check_email.dart';
import 'package:e_comerse_app/view/screens/auth/sign_up.dart';
import 'package:e_comerse_app/view/screens/auth/forget%20Password/reset_password.dart';
import 'package:e_comerse_app/view/screens/auth/forget%20Password/success_reset_password.dart';
import 'package:e_comerse_app/view/screens/home/notification_page.dart';
import 'package:e_comerse_app/view/screens/order/checkout.dart';
import 'package:e_comerse_app/view/screens/choose_lang.dart';
import 'package:e_comerse_app/view/screens/home/cart_page.dart';
import 'package:e_comerse_app/view/screens/home/favoirte_page.dart';
import 'package:e_comerse_app/view/screens/items/iteams_page.dart';
import 'package:e_comerse_app/view/screens/order/order_details_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'view/screens/auth/forget Password/verfiy_code_check_email.dart';
import 'view/screens/auth/success_sign_up.dart';
import 'view/screens/auth/verfiy_code_signup.dart';
import 'view/screens/items/iteams_details_page.dart';
import 'view/screens/on_boarding_screen.dart';
import 'view/screens/auth/login.dart';
import 'view/widgets/home/homeBottomAppBar.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [
    Mymiddleware(),
  ]),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //////////////////////////Auth//////////////////////
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignup, page: () => const VerfiyCodeSignUp()),
///////////////////////////////forget passwrod////////////////////////
  GetPage(name: AppRoute.forgetPassword, page: () => const CheckEmail()),
  GetPage(name: AppRoute.checkemail, page: () => const CheckEmail()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeCheckEmail,
      page: () => const VerfiyCodeCheckEmail()),
//////////////////////////////////Home //////////////////////
  GetPage(name: AppRoute.home, page: () => const HomeBottomNavBar()),
  GetPage(name: AppRoute.items, page: () => const ItemsPage()),
  GetPage(name: AppRoute.itemsDetails, page: () => const ItemsDetailsPage()),
  GetPage(name: AppRoute.favoirtePage, page: () => const FavoirtePage()),
  GetPage(name: AppRoute.notficationPage, page: () => const NotificationPage()),
  //////////////////////////////////cart //////////////////////
  GetPage(name: AppRoute.cart, page: () => const CartPage()),
  //////////////////////////////////address //////////////////////
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressEdit, page: () => const AddressEdit()),
  //////////////////////////////////Order //////////////////////
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderDeitails, page: () => const OrderDetails()),
];
