import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaho/core/config_reader.dart';
import 'package:yaho/router.dart';

import 'core/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  final configs = await ConfigReader.readConfig();
  AppConfig(configs: configs);
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RouteGenerate.userListScreen,
      onGenerateRoute: RouteGenerate.generateRoute,
    );
  }
}
