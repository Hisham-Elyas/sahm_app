import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_color.dart';
import '../../controller/payment_method_controller.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_buttom_widget.dart';
import 'payment_methods_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Checkout',
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 30.h),
              Text(
                'Shipping address',
                style: TextStyle(
                    color: AppColor.fontColor1,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp),
              ),
              SizedBox(height: 19.h),

              /// Shipping address
              Card(
                color: AppColor.whiteColor,
                child: SizedBox(
                  height: 108.h,
                  width: 343.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jane Doe',
                              style: TextStyle(
                                  color: AppColor.fontColor1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Change',
                                style: TextStyle(
                                    color: AppColor.redColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 7.h),
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            '3 Newbridge Court Chino Hills, CA 91709, United States',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColor.fontColor1,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 56.h),
              // Payment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const PaymentMethodsScreen());
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          color: AppColor.redColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                      color: AppColor.whiteColor,
                      child: SizedBox(
                        height: 38.h,
                        width: 64.w,
                      )),
                  SizedBox(width: 17.w),
                  GetBuilder<PaymentMethodController>(builder: (controller) {
                    return Text(
                      controller.maskCreditCardNumber(
                          controller.getDefaultCart().cardNumber),
                      style: TextStyle(
                          color: AppColor.fontColor1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    );
                  }),
                ],
              ),
              SizedBox(height: 50.h),
              //  Delivery method
              Text(
                'Delivery method',
                style: TextStyle(
                    color: AppColor.fontColor1,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp),
              ),
              SizedBox(height: 19.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                      color: AppColor.whiteColor,
                      child: SizedBox(
                        height: 72.h,
                        width: 100.w,
                        child: Image.asset("assets/images/fedex.png"),
                      )),
                  Card(
                      color: AppColor.whiteColor,
                      child: SizedBox(
                        height: 72.h,
                        width: 100.w,
                        child: Image.asset("assets/images/usps_com.png"),
                      )),
                  Card(
                      color: AppColor.whiteColor,
                      child: SizedBox(
                        height: 72.h,
                        width: 100.w,
                        child: Image.asset("assets/images/dhl.png"),
                      )),
                ],
              ),
              SizedBox(height: 52.h),
              // Summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order:',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                  Text(
                    '112\$',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery:',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                  Text(
                    '15\$',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Summary:',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp),
                  ),
                  Text(
                    '127\$',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              CustomButtom(
                height: 48.h,
                titel: 'SUBMIT ORDER',
                onTap: () {},
              )
            ])));
  }
}
