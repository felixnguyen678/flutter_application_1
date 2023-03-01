import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_config.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/constants/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllScreen extends StatefulWidget {
  const ControllScreen({super.key});

  @override
  State<ControllScreen> createState() => _ControllScreenState();
}

class _ControllScreenState extends State<ControllScreen> {
  double _sliderValue = AppConfig.defaultNumberOfSlider.toDouble();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initDefaultValue();
  }

  initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    int value =
        prefs.getInt(SharedKeys.counter) ?? AppConfig.defaultNumberOfSlider;
    setState(() {
      _sliderValue = value.toDouble();
    });
  }

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
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(SharedKeys.counter, _sliderValue.toInt());
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
            '${_sliderValue.toInt()}',
            style: AppStyles.h1.copyWith(
              fontSize: 150,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
              value: _sliderValue,
              min: 5,
              max: 100,
              divisions: 100,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
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
