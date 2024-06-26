// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_color.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onTap;
  final String titel;
  final bool isOutLine;
  final double? width;
  final double? height;

  const CustomButtom({
    super.key,
    this.onTap,
    required this.titel,
    this.isOutLine = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: isOutLine
                ? Border.all(color: const Color(0xff222222), width: 1.5)
                : null,
            color: isOutLine ? null : AppColor.mainColor),
        child: Text(
          titel,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: isOutLine
                  ? const Color(0xff000000)
                  : const Color(0xffFFFFFF)),
        ),
      ),
    );
  }
}
