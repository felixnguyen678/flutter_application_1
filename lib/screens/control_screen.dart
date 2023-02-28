import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';

class ControllScreen extends StatefulWidget {
  const ControllScreen({super.key});

  @override
  State<ControllScreen> createState() => _ControllScreenState();
}

class _ControllScreenState extends State<ControllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text('Your Control',
            style: AppStyles.h3
                .copyWith(color: AppColors.textColor, fontSize: 36)),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(width: double.infinity, child: Column(children: [
        
      ]),),
    );
  }
}
