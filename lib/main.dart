import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahm_app/constants/app_color.dart';

import 'controller/payment_method_controller.dart';
import 'view/Order Details/order_details_screen.dart';
import 'view/Payment/checkout_screen.dart';
import 'view/Payment/payment_methods_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => PaymentMethodController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.mainColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'SAHM_APP',
        // home: const OrderDetailsScreen(),
        home: const CheckoutScreen(),
        // home: const PaymentMethodsScreen(),
      ),
    );
  }
}
