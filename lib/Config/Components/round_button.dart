import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  String title;
  double height;
  double width;
  final VoidCallback onPress;
  RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.height = 50,
      this.width = 200});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.buttonColor),
        child: Center(
            child: Text(title,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.whiteColor,
                ))),
      ),
    );
  }
}
