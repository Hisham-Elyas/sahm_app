import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function() onTap;
  const CustomFloatingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 28.r,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.dm,
        ),
      ),
    );
  }
}
