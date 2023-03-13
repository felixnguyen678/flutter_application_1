import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_assets.dart';
import 'package:flutter_application_1/constants/app_colors.dart';
import 'package:flutter_application_1/constants/app_styles.dart';
import 'package:flutter_application_1/models/english_today.dart';

class AllWordsScreen extends StatefulWidget {
  final List<EnglishToday> words;
  final void Function(int) toggleFavorite;
  const AllWordsScreen(
      {super.key, required this.words, required this.toggleFavorite});

  @override
  State<AllWordsScreen> createState() => _AllWordsScreenState();
}

class _AllWordsScreenState extends State<AllWordsScreen> {
  late List<EnglishToday> _words;

  @override
  void initState() {
    super.initState();
    _words = widget.words;
  }

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
          itemCount: _words.length,
          itemBuilder: ((context, index) => InkWell(
                splashColor: Colors.black38,
                onTap: () {
                  setState(() {
                    _words[index].isFavorite = !_words[index].isFavorite;
                  });
                  widget.toggleFavorite(index);
                  print('ahihi');
                },
                child: ListTile(
                  title: Text(_words[index].noun!),
                  subtitle: Text(_words[index].quote!),
                  contentPadding: const EdgeInsets.all(15),
                  tileColor: index % 2 == 0
                      ? AppColors.primaryColor
                      : AppColors.subPrimaryColor,
                  leading: Icon(
                    Icons.favorite,
                    color: _words[index].isFavorite == true
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ))),
    );
  }
}
