import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    'Welcome to',
                    style: AppStyles.h3,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Text(
                          'English',
                          style: AppStyles.h2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackGrey),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            '"Quotes"',
                            textAlign: TextAlign.end,
                            style: AppStyles.h4.copyWith(height: 0.5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: RawMaterialButton(
                  onPressed: () => {
                    // push but cannot back
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false)
                  },
                  fillColor: AppColors.lighBlue,
                  shape: CircleBorder(),
                  child: Image.asset(AppAssets.rightArrow),
                ),
              ))
            ],
          ),
        ));
  }
}
