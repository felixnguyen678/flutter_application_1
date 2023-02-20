import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/elements/app_button.dart';
import 'package:flutter_application_1/elements/slider_indicator.dart';
import 'package:flutter_application_1/models/english_today.dart';
import 'package:flutter_application_1/packages/quote/qoute_model.dart';
import 'package:flutter_application_1/packages/quote/quote.dart';
import 'package:flutter_application_1/packages/randoms.dart';

const int NUMBER_OF_SLIDER = 10;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> words = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .85);
    getEnglishToday();
    super.initState();
  }

  getEnglishToday() {
    List<String> newList = [];
    List<int> rans = randomFixedList(len: NUMBER_OF_SLIDER, max: nouns.length);
    rans.forEach((value) {
      newList.add(nouns[value]);
    });

    words = newList.map((e) {
      Quote? quote = getQuote(e);
      print(quote?.content);
      return EnglishToday(noun: e, quote: quote?.content, id: quote?.id);
    }).toList();
  }

  getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return quote;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
        leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset(AppAssets.menu)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(children: [
          Container(
            height: size.height / 6,
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerLeft,
            child: Text(
                "sfd sdflskjf sdflskjs sflsdkfj sflksjdf sfd sdflskjf sdflskjs sflsdkfj sflksjdf sfd sdflskjf sdflskjs sflsdkfj sflksjdf ",
                style: AppStyles.h6.copyWith(
                  color: AppColors.textColor,
                  fontSize: 18,
                )),
          ),
          SizedBox(
              height: size.height * 3 / 5,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  itemCount: NUMBER_OF_SLIDER,
                  itemBuilder: (context, index) {
                    String firstLetter = words[index].noun != null
                        ? words[index].noun!.substring(0, 1)
                        : '';
                    String remainedLetters = words[index].noun != null
                        ? words[index].noun!.substring(1)
                        : '';

                    String? quote = words[index].quote;
                    return Container(
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 3),
                                blurRadius: 6)
                          ]),
                      padding: const EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                          left: index > 0 ? 8 : 0,
                          right: index < NUMBER_OF_SLIDER - 1 ? 8 : 0,
                          bottom: 8),
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
                                  text: firstLetter,
                                  children: [
                                    TextSpan(
                                        text: remainedLetters,
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
                                child: Text('"$quote"',
                                    style: AppStyles.h4.copyWith(
                                        letterSpacing: 1,
                                        color: AppColors.textColor)))
                          ]),
                    );
                  })),
          Container(
              height: 20,
              padding: EdgeInsets.only(
                left: 12,
                right: size.width / 5,
              ),
              margin: const EdgeInsets.only(top: 12),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: NUMBER_OF_SLIDER,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SliderIndicator(
                      isActive: index == _currentIndex, size: size);
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
      drawer: Drawer(
        child: Container(
          color: AppColors.lighBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, top: size.height / 10),
                child: Text('Your mind',
                    style: AppStyles.h3.copyWith(
                      color: AppColors.textColor,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: AppButton(text: 'Favorites ', onTap: () {}),
              ),
              AppButton(text: 'Your control ', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
