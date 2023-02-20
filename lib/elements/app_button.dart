import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
            color: Colors.black38,
            offset: Offset(2, 3),
            blurRadius: 6
          )
          ]),
      child: Text(
        text,
        style: AppStyles.h4.copyWith(color: AppColors.textColor),
      ),
    );
  }
}
