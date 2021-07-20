import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_db_app/common/constants/language.dart';
import 'package:movie_db_app/presentation/app_localizations.dart';
import 'package:movie_db_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';
import 'package:movie_db_app/presentation/themes/theme_text.dart';

import '../common/screenutil/screenutil.dart';

class MovieApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(

        accentColor: AppColor.royalBlue,
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0)
      ),
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      locale: Locale(Languages.languages[0].code),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: HomeScreen(),
    );
  }
}