// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaho/core/app_config.dart';
import 'package:yaho/core/config_reader.dart';
import 'package:yaho/features/user_list/domains/bussinesses/user_bussiness.dart';
import 'package:yaho/features/user_list/infrastructures/services/user_service_impl.dart';

void main() async {
  group('UserBussiness', () {
    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      final configs = await ConfigReader.readConfig();
      AppConfig(configs: configs);
    });
    test('UserBussiness-initListUser', () async {
      final userBussiness = UserBussiness(UserServiceImpl());
      expect(userBussiness.listUser, []);
      await userBussiness.initListUser();
      expect(userBussiness.listUser.isNotEmpty, true);
      expect(userBussiness.listUser.last.isFake, true);
    });
    test('UserBussiness-loadMore', () async {
      final userBussiness = UserBussiness(UserServiceImpl());
      await userBussiness.initListUser();
      final listUser = userBussiness.listUser;
      expect(listUser.where((e) => !e.isFake).length, 6);
      expect(userBussiness.listUser.last.isFake, true);
      await userBussiness.loadMore();
      expect(listUser.where((e) => !e.isFake).length, 12);
      expect(userBussiness.listUser.last.isFake, true);
      expect(
        userBussiness.listUser.where((element) => element.isFake).length,
        1,
      );
    });
  });
}
