import 'package:flutter/material.dart';
import 'package:movies_app_bloc/Config/Colors/app_colors.dart';

class LoadingButton extends StatelessWidget {
  double height;
  double width;
  LoadingButton({super.key, this.height = 60, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.buttonColor),
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
