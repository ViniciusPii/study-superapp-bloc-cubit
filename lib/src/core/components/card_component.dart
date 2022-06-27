import 'package:flutter/material.dart';

import 'package:superapp/src/core/theme/app_colors.dart';
import 'package:superapp/src/core/theme/app_dimension.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';
import 'package:superapp/src/core/utils/utils.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    required this.title,
    required this.func,
    required this.description,
    this.color = AppColors.white,
  }) : super(key: key);

  final Color color;
  final String title;
  final Function() func;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimension.size_1,
          ),
          child: ListTile(
            title: Text(
              title,
              style: AppFonts.titleMedium(
                color: Utils.getLuminanceColor(color),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                top: AppDimension.size_1,
              ),
              child: Text(
                description,
                style: AppFonts.bodySmall(
                  color: Utils.getLuminanceColor(color),
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Utils.getLuminanceColor(color),
            ),
          ),
        ),
      ),
    );
  }
}
