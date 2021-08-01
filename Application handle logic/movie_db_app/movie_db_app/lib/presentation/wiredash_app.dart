import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp(
      {Key key,
        @required this.navigatorKey,
        @required this.child,
        @required this.languageCode,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: "movie_app-7gaqrqd",
        secret: "pl0bg89eqr42hl635kty53rwlke48n3tctsxllgxo2bq3zc8",
        navigatorKey: navigatorKey,
        theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan
        ),
        options: WiredashOptionsData(
          locale: Locale.fromSubtags(languageCode: languageCode)
        ),
        child: child);
  }
}
