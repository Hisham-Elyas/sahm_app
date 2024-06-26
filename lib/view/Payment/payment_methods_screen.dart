// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../constants/app_color.dart';
import '../../controller/payment_method_controller.dart';
import '../../model/payment_card_model.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_buttom_widget.dart';
import '../widget/custom_floating_buttom.dart';

class PaymentMethodsScreen extends GetView<PaymentMethodController> {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Payment methods',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              'Your payment cards',
              style: TextStyle(
                  color: AppColor.fontColor1,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.sp),
            ),
            SizedBox(height: 27.h),
            GetBuilder<PaymentMethodController>(builder: (controller) {
              return Expanded(
                child: ListView.separated(
                    itemCount: controller.paymentCardList.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemBuilder: (context, index) => CreditCardWidget(
                          paymentCard: controller.paymentCardList[index],
                        )),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          controller.showAddCartbottomSheet();
        },
      ),
    );
  }
}

class CreditCardWidget extends GetView<PaymentMethodController> {
  final PaymentCardModel paymentCard;
  const CreditCardWidget({
    super.key,
    required this.paymentCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CreditCardUi(
            cardHolderFullName: paymentCard.cardHolderFullName,
            cardNumber: paymentCard.cardNumber,
            validFrom: paymentCard.releseDate,
            validThru: paymentCard.expireDate,
            topLeftColor: controller.getRandColorCard(),
            doesSupportNfc: false,
            enableFlipping: true,
            cardType: CardType.other,
            cvvNumber: paymentCard.cvvNumber,
          ),
        ),
        Row(
          children: [
            GetBuilder<PaymentMethodController>(
              builder: (controller) => Checkbox(
                value: paymentCard.isDefault,
                onChanged: (value) {
                  controller.setCartToDefault(paymentCard: paymentCard);
                },
              ),
            ),
            Text(
              'Use as default payment method',
              style: TextStyle(
                  color: AppColor.fontColor1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }
}
