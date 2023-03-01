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
  double sliderValue = 5;
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
      body: Container(
        width: double.infinity,
        child: Column(children: [
          Spacer(),
          Text(
            'How much a number word at once',
            style: AppStyles.h4.copyWith(
              color: AppColors.blackGrey,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Text(
            '${sliderValue.toInt()}',
            style: AppStyles.h1.copyWith(
              fontSize: 150,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
              value: sliderValue,
              min: 5,
              max: 100,
              divisions: 100,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              }),
          Text(
            'Slide to change',
            style: AppStyles.h1.copyWith(
              fontSize: 15,
              color: AppColors.blackGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Spacer(),
          Spacer(),
        ]),
      ),
    );
  }
}
