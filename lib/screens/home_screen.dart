import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_config.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/constants/shared_keys.dart';
import 'package:flutter_application_1/elements/app_button.dart';
import 'package:flutter_application_1/elements/slider_indicator.dart';
import 'package:flutter_application_1/models/english_today.dart';
import 'package:flutter_application_1/packages/quote/qoute_model.dart';
import 'package:flutter_application_1/packages/quote/quote.dart';
import 'package:flutter_application_1/packages/randoms.dart';
import 'package:flutter_application_1/screens/all_words_screen.dart';
import 'package:flutter_application_1/screens/control_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex = 0;
  late PageController _pageController;
  late int _refreshingCount = 0;

  late List<EnglishToday> _words = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .85);
    getEnglishToday();
  }

  getEnglishToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int len = await prefs.getInt(SharedKeys.counter) ??
        AppConfig.defaultNumberOfSlider;
    List<String> newList = [];
    List<int> rans = randomFixedList(len: len, max: nouns.length);
    rans.forEach((value) {
      newList.add(nouns[value]);
    });

    List<EnglishToday> newWords = newList.map((e) {
      Quote? quote = getQuote(e);
      while (quote?.content == null) {
        List<int> newRans = randomFixedList(len: 1, max: nouns.length);
        e = nouns[newRans[0]];
        quote = getQuote(e);
      }
      return EnglishToday(noun: e, quote: quote?.content, id: quote?.id);
    }).toList();

    setState(() {
      _words = newWords;
    });
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
              height: size.height * 5 / 9,
              child: _words.isEmpty
                  ? null
                  : PageView.builder(
                      key: Key(_refreshingCount.toString()),
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      itemCount: _words.length > AppConfig.defaultNumberOfSlider
                          ? AppConfig.defaultNumberOfSlider + 1
                          : _words.length,
                      itemBuilder: (context, index) {
                        if (index < AppConfig.defaultNumberOfSlider) {
                          String firstLetter = _words[index].noun != null
                              ? _words[index].noun!.substring(0, 1)
                              : '';
                          String remainedLetters = _words[index].noun != null
                              ? _words[index].noun!.substring(1)
                              : '';
                          bool isLiked = _words[index].isFavorite;
                          String? quote = _words[index].quote;
                          return Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Material(
                              elevation: 4,
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(24),
                              child: InkWell(
                                splashColor: Colors.black38,
                                onDoubleTap: () {
                                  setState(() {
                                    _words[index].isFavorite =
                                        !_words[index].isFavorite;
                                  });
                                },
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: EdgeInsets.only(
                                      left: index > 0 ? 8 : 0,
                                      right: index < _words.length - 1 ? 8 : 0,
                                      bottom: 8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            AppAssets.heart,
                                            color: isLiked
                                                ? Colors.red
                                                : Colors.white,
                                          ),
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
                                                        fontFamily:
                                                            FontFamily.sen,
                                                        fontSize: 56,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        shadows: const [
                                                          BoxShadow(
                                                              blurRadius: 6,
                                                              color: Colors
                                                                  .black38,
                                                              offset:
                                                                  Offset(3, 6))
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
                                            padding:
                                                const EdgeInsets.only(top: 32),
                                            child: AutoSizeText(
                                              '"$quote"',
                                              style: AppStyles.h4.copyWith(
                                                  letterSpacing: 1,
                                                  color: AppColors.textColor),
                                              maxFontSize: 24,
                                            ))
                                      ]),
                                ),
                              ),
                            ),
                          );
                        }

                        return buildShowMore();
                      })),
          buildBottom(size),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getEnglishToday();
          setState(() {
            _currentIndex = 0;
            _refreshingCount += 1;
          });
        },
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
              AppButton(
                  text: 'Your control ',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ControllScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottom(size) {
    if (_currentIndex < AppConfig.defaultNumberOfSlider + 1) {
      return Container(
          height: 20,
          padding: EdgeInsets.only(
            left: 12,
            right: size.width / 5,
          ),
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppConfig.defaultNumberOfSlider,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SliderIndicator(
                  isActive: index == _currentIndex ||
                      (index == AppConfig.defaultNumberOfSlider - 1 &&
                          _currentIndex == AppConfig.defaultNumberOfSlider),
                  size: size);
            },
          ));
    }
    return Container(
      margin: EdgeInsets.all(16.0),
      child: buildShowMore(),
    );
  }

  Widget buildShowMore() {
   return Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Material(
                              elevation: 4,
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(24),
                              child: InkWell(
                                splashColor: Colors.black38,
                                onTap: () {
                                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AllWordsScreen(
                        words: this._words,
                      )));
                                },
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 8),
                                  child: Center(
                                    child: Text('Show more ...', style: AppStyles.h2.copyWith(
                                      shadows: const [
                                        BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(3,3),
                                        blurRadius: 6,
                                      )
                                      ]
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ); 
  }
}
