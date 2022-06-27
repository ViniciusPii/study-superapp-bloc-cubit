import 'package:flutter/material.dart';
import 'package:superapp/src/core/theme/app_colors.dart';
import 'package:superapp/src/core/theme/app_extension.dart';

class Utils {
  Utils._();

  static Color getColor(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments as Color;
  }

  static Color getLuminanceColor(Color color) {
    return color.computeLuminance() >= 0.5 ? AppExtension.textColor : AppColors.white;
  }
}
