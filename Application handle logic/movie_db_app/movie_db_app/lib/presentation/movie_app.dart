import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_db_app/common/constants/language.dart';
import 'package:movie_db_app/common/constants/route_constants.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/app_localizations.dart';
import 'package:movie_db_app/presentation/blocs/language/language_cubit.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_db_app/presentation/blocs/login/login_bloc.dart';
import 'package:movie_db_app/presentation/journeys/loading/loading_screen.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';
import 'package:movie_db_app/presentation/themes/theme_text.dart';
import 'package:movie_db_app/presentation/widgets/fade_page_route_builder.dart';
import 'package:movie_db_app/presentation/widgets/routes.dart';
import 'package:movie_db_app/presentation/wiredash_app.dart';

import '../common/screenutil/screenutil.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageCubit _languageCubit;
  final _navigatorKey = GlobalKey<NavigatorState>();
  LoginBloc _loginBloc;
  LoadingCubit _loadingCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit.loadPreferredLanguage();
    _loginBloc = getItInstance<LoginBloc>();
    _loadingCubit = getItInstance<LoadingCubit>();
  }

  @override
  void dispose() {
    _languageCubit?.close();
    _loginBloc?.close();
    _loadingCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>.value(value: _languageCubit),
        BlocProvider<LoginBloc>.value(value: _loginBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit)
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
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
                locale: locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                builder: (context, child) {
                  return LoadingScreen(
                    screen: child,
                  );
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder builder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: builder,
                    settings: settings,
                  );
                },
              ),
            );
        },
      ),
    );
  }
}
