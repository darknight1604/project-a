import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      );

  TextStyle get semiBold => copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      );

  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 16.0,
      );
}
