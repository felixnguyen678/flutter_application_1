import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text('English today', style: AppStyles.h3.copyWith(
          color: AppColors.textColor, 
          fontSize: 36,
        ),),
        leading: InkWell(
          onTap: () {

          },
          child: Image.asset(AppAssets.menu)
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          Text("sfd sdflskjf sdflskjs sflsdkfj sflksjdf ")
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Image.asset(AppAssets.exchange),
        backgroundColor: AppColors.primaryColor ,
      ),
    );
  }
}