import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sahm_app/constants/app_color.dart';

import '../widget/custom_app_bar.dart';
import '../widget/custom_buttom_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: CustomAppBar(
        title: 'Order Details',
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.h),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 30.h),

              ///Order Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order №1947034',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                  Text(
                    '02-28-2024',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleAndDescription(
                      title: "Tracking number", decoration: "IW3475453455"),
                  Text(
                    'Delivered',
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              // items
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '3 items',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 320.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(height: 24.h),
                  itemBuilder: (context, index) => const ProductWidget(),
                ),
              ),
              SizedBox(height: 10.h),

              /// Order information
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order information',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    'Shipping Address:',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "3 Newbridge Court ,Chino Hills, CA 91709, United States",
                      softWrap: true,
                      style: TextStyle(
                          color: AppColor.fontColor1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              titleAndDescription(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  title: 'Payment method',
                  decoration: "**** **** **** 3947"),
              SizedBox(height: 24.h),
              titleAndDescription(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  title: 'Delivery method',
                  decoration: "FedEx, 3 days, 15\$"),
              SizedBox(height: 24.h),
              titleAndDescription(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  title: 'Discount',
                  decoration: "10%, Personal promo code"),
              SizedBox(height: 24.h),
              titleAndDescription(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  title: 'Total Amount',
                  decoration: "133\$"),
              SizedBox(height: 34.h),
              Row(
                children: [
                  CustomButtom(
                    width: 160.w,
                    height: 36.h,
                    titel: 'Reorder',
                    isOutLine: true,
                    onTap: () {},
                  ),
                  SizedBox(width: 23.w),
                  CustomButtom(
                    width: 160.w,
                    height: 36.h,
                    titel: 'Home',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 37.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        height: 104.h,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/photo1.png",
              height: 104.dm,
              width: 104.dm,
              fit: BoxFit.contain,
            ).paddingZero,
            SizedBox(width: 11.w),
            Padding(
              padding: EdgeInsets.only(top: 11.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pullover',
                    style: TextStyle(
                        color: AppColor.fontColor1,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                  Text(
                    'Mango',
                    style: TextStyle(
                        color: AppColor.fontColor2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                  Row(
                    children: [
                      titleAndDescription(title: 'Color', decoration: "Gray"),
                      SizedBox(width: 25.w),
                      titleAndDescription(title: 'Size', decoration: "L"),
                    ],
                  ),
                  titleAndDescription(title: 'Units', decoration: "1"),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 14.h, end: 18.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '51\$',
                  style: TextStyle(
                      color: AppColor.fontColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleAndDescription(
    {required String title,
    required String decoration,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        '$title :  ',
        style: TextStyle(
            color: AppColor.fontColor2,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp),
      ),
      Text(
        decoration,
        style: TextStyle(
            color: AppColor.fontColor1,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp),
      )
    ],
  );
}
