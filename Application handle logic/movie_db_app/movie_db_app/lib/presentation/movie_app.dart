import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_db_app/common/constants/language.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/app_localizations.dart';
import 'package:movie_db_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_db_app/presentation/blocs/language/language_state.dart';
import 'package:movie_db_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';
import 'package:movie_db_app/presentation/themes/theme_text.dart';

import '../common/screenutil/screenutil.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc _languageBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
        value: _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if(state is LanguageLoaded){
              print('$state');
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                    accentColor: AppColor.royalBlue,
                    primaryColor: AppColor.vulcan,
                    scaffoldBackgroundColor: AppColor.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0)),
                supportedLocales:
                Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                home: HomeScreen(),
              );
            }else{
              return const SizedBox.shrink();
            }

          },
        ));
  }
}
