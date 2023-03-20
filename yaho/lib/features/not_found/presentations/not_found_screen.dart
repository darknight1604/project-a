import 'package:flutter/material.dart';
import 'package:yaho/gen/locale_keys.g.dart';
import 'package:yaho/core/extensions/text_style_extension.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          LocaleKeys.notFound,
          style: Theme.of(context).textTheme.bodyMedium?.bold,
        ),
      ),
    );
  }
}
