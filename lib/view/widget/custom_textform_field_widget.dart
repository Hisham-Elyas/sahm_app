import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahm_app/constants/app_color.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const CustomTextFormFieldWidget({
    super.key,
    this.labelText,
    this.maxLines,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: AppColor.whiteColor,
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          fillColor: AppColor.whiteColor,
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
