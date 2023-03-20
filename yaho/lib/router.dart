import 'package:flutter/material.dart';

import 'features/user_list/presentations/user_list_screen.dart';

class RouteGenerate {
  static const String userListScreen = '/userListScreen';

  RouteGenerate._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userListScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const UserListScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const UserListScreen();
          },
        );
    }
  }
}
