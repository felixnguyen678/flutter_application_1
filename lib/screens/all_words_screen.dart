import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/models/english_today.dart';

class AllWordsScreen extends StatelessWidget {
  final List<EnglishToday> words;
  const AllWordsScreen({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text('English Today',
            style: AppStyles.h3
                .copyWith(color: AppColors.textColor, fontSize: 36)),
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: ((context, index) => InkWell(
            splashColor: Colors.black38,
            child: ListTile(
                  title: Text(words[index].noun!),
                  subtitle: Text(words[index].quote!),
                  contentPadding: const EdgeInsets.all(15),
                  tileColor: index % 2 == 0
                      ? AppColors.primaryColor
                      : AppColors.subPrimaryColor,
                  leading: Icon(
                    Icons.favorite,
                    color: words[index].isFavorite == true
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
          ))),
    );
  }
}
