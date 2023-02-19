import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/elements/slider_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(
            color: AppColors.textColor,
            fontSize: 36,
          ),
        ),
        leading: InkWell(onTap: () {}, child: Image.asset(AppAssets.menu)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          Container(
            height: size.height / 10,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
                "sfd sdflskjf sdflskjs sflsdkfj sflksjdf sfd sdflskjf sdflskjs sflsdkfj sflksjdf sfd sdflskjf sdflskjs sflsdkfj sflksjdf ",
                style: AppStyles.h6.copyWith(
                  color: AppColors.textColor,
                  fontSize: 12,
                )),
          ),
          Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                          
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(AppAssets.heart),
                              alignment: Alignment.centerRight,
                            ),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: 'B',
                                  children: [
                                    TextSpan(
                                        text: 'eautiful',
                                        style: TextStyle(
                                            fontFamily: FontFamily.sen,
                                            fontSize: 56,
                                            fontWeight: FontWeight.bold,
                                            shadows: const [
                                              BoxShadow(
                                                  blurRadius: 6,
                                                  color: Colors.black38,
                                                  offset: Offset(3, 6))
                                            ]))
                                  ],
                                  style: TextStyle(
                                      fontFamily: FontFamily.sen,
                                      fontSize: 89,
                                      fontWeight: FontWeight.bold,
                                      shadows: const [
                                        BoxShadow(
                                            blurRadius: 6,
                                            color: Colors.black38,
                                            offset: Offset(3, 6))
                                      ])),
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 32),
                                child: Text(
                                    '"sdfsdfl sdlkfj sdflkj sdflkjs lkjsdfj lkjsd lkjsdlfk lkjfsldkj"',
                                    style: AppStyles.h4.copyWith(
                                        letterSpacing: 1,
                                        color: AppColors.blackGrey)))
                          ]),
                    );
                  })),
          Container(
              height: 20,
              padding: EdgeInsets.only(
                left: 12,
                right: size.width /5,
              ),
              margin: const EdgeInsets.only(top: 12),
              child: 
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10, 
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SliderIndicator(isActive: index == _currentIndex, size: size);
                }, 
              )
                // Container(color: Colors.red,)
              )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AppAssets.exchange),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
