import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';
import '../model/payment_card_model.dart';
import '../view/widget/custom_TextForm_field_widget.dart';
import '../view/widget/custom_buttom_widget.dart';

class PaymentMethodController extends GetxController {
  final GlobalKey<FormState> cartformKey = GlobalKey();
  late PaymentCardModel newPaymentCardItim = PaymentCardModel(
      cardHolderFullName: '',
      cardNumber: '',
      cvvNumber: '',
      releseDate: '',
      expireDate: '');
  bool isSetNewCartAsDefault = false;
  set setNewCartAsDefault(val) {
    isSetNewCartAsDefault = val;
    update();
  }

  final List<PaymentCardModel> paymentCardList = [
    PaymentCardModel(
        cardHolderFullName: "Jennyfer Doe",
        cardNumber: "6435678925633947",
        cvvNumber: "123",
        releseDate: "05/22",
        expireDate: "05/23"),
    PaymentCardModel(
        cardHolderFullName: "Hisham elyas",
        cardNumber: "6435678925633947",
        cvvNumber: "123",
        releseDate: "05/22",
        expireDate: "05/23",
        isDefault: true)
  ];
  @override
  void onInit() {
    bool isDefaultFond = false;
    for (var element in paymentCardList) {
      if (element.isDefault == true) {
        isDefaultFond = true;
      } else {
        isDefaultFond = false;
      }
    }
    if (!isDefaultFond) {
      paymentCardList[0].isDefault = true;
    }
    super.onInit();
  }

  String maskCreditCardNumber(String cardNumber) {
    cardNumber.replaceAll(' ', '').replaceAll('-', '');

    final length = cardNumber.length;
    var maskedNumber = '';

    for (var i = 0; i < length; i++) {
      if (i < 4 || (i >= 12)) {
        // keep the first 4 digits and the last 4 digits visible
        maskedNumber += cardNumber[i];
      } else {
        // mask the digits between 4 and the length-4 with asterisks
        maskedNumber += '*';
      }
    }
    String groupDigits(String input) {
      if (input.isEmpty) {
        return input;
      }

      final groups = <String>[];
      final length = input.length;

      for (var i = 0; i < length; i += 4) {
        final groupLength = i + 4 <= length ? 4 : length - i;
        final group = input.substring(i, i + groupLength);
        groups.add(group);
      }

      return groups.join(' ');
    }

    return groupDigits(maskedNumber);
  }

  void setCartToDefault({required PaymentCardModel paymentCard}) {
    for (var element in paymentCardList) {
      if (element == paymentCard) {
        element.isDefault = true;
      } else {
        element.isDefault = false;
      }
    }
    update();
  }

  PaymentCardModel getDefaultCart() {
    return paymentCardList.firstWhere(
      (element) => element.isDefault == true,

      /// if not found Default  return first cart as Default
      orElse: () => paymentCardList[0].copyWith(isDefault: true),
    );
  }

  void addPaymentCart() {
    Get.focusScope!.unfocus();
    if (!cartformKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    cartformKey.currentState!.save();
    paymentCardList.add(newPaymentCardItim);
    if (isSetNewCartAsDefault) {
      setCartToDefault(paymentCard: newPaymentCardItim);
    }
    isSetNewCartAsDefault = false;
    Get.close(1);
    update();
    print(newPaymentCardItim);
  }

  Color getRandColorCard() {
    final List<Color> cardColorList = [
      Colors.black,
      Colors.blue,
      Colors.red,
      Colors.grey,
    ];
    return cardColorList[Random().nextInt(3)];
  }

  void showAddCartbottomSheet() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: cartformKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Add new card',
                  style: TextStyle(
                      color: AppColor.fontColor1,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.sp),
                ),
                SizedBox(height: 5.h),
                CustomTextFormFieldWidget(
                  labelText: 'Name on card',
                  onSaved: (value) {
                    newPaymentCardItim =
                        newPaymentCardItim.copyWith(cardHolderFullName: value);
                  },
                  validator: (value) => MyValidator().userNameValidator(value),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFieldWidget(
                  labelText: 'Card number',
                  onSaved: (value) {
                    newPaymentCardItim =
                        newPaymentCardItim.copyWith(cardNumber: value);
                  },
                  validator: (value) =>
                      MyValidator().cardNumbervalidator(value),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFieldWidget(
                  labelText: 'Relese Date',
                  onSaved: (value) {
                    newPaymentCardItim =
                        newPaymentCardItim.copyWith(releseDate: value);
                  },
                  validator: (value) =>
                      MyValidator().releseDateValidator(value),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFieldWidget(
                  labelText: 'Expire Date',
                  onSaved: (value) {
                    newPaymentCardItim =
                        newPaymentCardItim.copyWith(expireDate: value);
                  },
                  validator: (value) =>
                      MyValidator().expireDateValidator(value),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFieldWidget(
                  labelText: 'CVV',
                  onSaved: (value) {
                    newPaymentCardItim =
                        newPaymentCardItim.copyWith(cvvNumber: value);
                  },
                  validator: (value) => MyValidator().cvvNumberValidator(value),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    GetBuilder<PaymentMethodController>(
                      builder: (controller) => Checkbox(
                        value: controller.isSetNewCartAsDefault,
                        onChanged: (value) {
                          controller.setNewCartAsDefault = value;
                        },
                      ),
                    ),
                    Text(
                      'Set as default payment method',
                      style: TextStyle(
                          color: AppColor.fontColor1,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                CustomButtom(
                  titel: 'ADD CARD',
                  height: 48.h,
                  onTap: () {
                    addPaymentCart();
                  },
                ),
                SizedBox(height: 22.h),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundColor,
    );
  }
}

class MyValidator {
  String? cardNumbervalidator(String? val) {
    final cardNumberRegEx = RegExp(
        r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');
    if (val == null || val.isEmpty) {
      return "Please enter Card Number";
    } else if (cardNumberRegEx.hasMatch(val)) {
      return "Please enter a valid Card Number";
    } else {
      return null;
    }
  }

  String? userNameValidator(String? val) {
    final usernameRegEx = RegExp(r'^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]{3,}$');
    if (val == null || val.isEmpty) {
      return "Please enter full name";
    } else if (usernameRegEx.hasMatch(val)) {
      return "Please enter full name,Username must be at leat 3 charcters and contain letters";
    } else {
      return null;
    }
  }

  String? releseDateValidator(String? val) {
    final releseDateRegEx = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$');
    if (val == null || val.isEmpty) {
      return "Please enter Relese Date";
    } else if (releseDateRegEx.hasMatch(val)) {
      return "Please enter a valid Relese Date";
    } else {
      return null;
    }
  }

  String? expireDateValidator(String? val) {
    final expireDateRegEx = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$');
    if (val == null || val.isEmpty) {
      return "Please enter Expire Date";
    } else if (expireDateRegEx.hasMatch(val)) {
      return "Please enter a valid Expire Date";
    } else {
      return null;
    }
  }

  String? cvvNumberValidator(String? val) {
    final cvvNumberRegEx = RegExp(r'^[0-9]{3,4}$');
    if (val == null || val.isEmpty) {
      return "Please enter Cvv Number";
    } else if (cvvNumberRegEx.hasMatch(val)) {
      return "Please enter a valid Cvv Number";
    } else {
      return null;
    }
  }
}
