import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movie_db_app/domain/table/movie_table.dart';
import 'package:movie_db_app/presentation/movie_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pedantic/pedantic.dart';

import 'di/get_it.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  runApp(MovieApp());
}
