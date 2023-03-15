import 'dart:convert';

import 'package:flutter/services.dart';

import '../gen/assets.gen.dart';

class ConfigReader {
  static Future<Map<String, dynamic>> readConfig() async {
    String response = await rootBundle.loadString(Assets.config);
    return await json.decode(response);
  }
}
