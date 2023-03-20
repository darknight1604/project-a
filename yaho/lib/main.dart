import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaho/core/config_reader.dart';
import 'package:yaho/router.dart';

import 'core/app_config.dart';
import 'features/user_list/blocs/user_list/user_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final configs = await ConfigReader.readConfig();
  AppConfig(configs: configs);
  runApp(const MyApp());
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
      initialRoute: RouteGenerate.userListScreen,
      onGenerateRoute: RouteGenerate.generateRoute,
    );
  }
}
