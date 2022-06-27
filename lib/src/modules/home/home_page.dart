import 'package:flutter/material.dart';
import 'package:superapp/src/core/components/card_component.dart';
import 'package:superapp/src/core/components/status_bar_component.dart';
import 'package:superapp/src/core/theme/app_colors.dart';
import 'package:superapp/src/core/theme/app_dimension.dart';
import 'package:superapp/src/core/theme/app_extension.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarComponent(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.size_4,
              horizontal: AppDimension.size_3,
            ),
            child: Column(
              children: [
                _buildTitle(),
                const SizedBox(
                  height: AppDimension.size_2,
                ),
                Column(
                  children: [
                    CardComponent(
                      func: () {},
                      title: 'Contador',
                      color: AppColors.blue800,
                      description: 'App que incrementa e decrementa um contador!',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SuperApp',
          style: AppFonts.titleLarge(),
        ),
        const SizedBox(
          height: AppDimension.size_1,
        ),
        Text(
          'App para estudos com bloc puro, bloc em pkg, cubit e getx!',
          style: AppFonts.bodyLarge(
            color: AppExtension.textLightColor,
          ),
        ),
      ],
    );
  }
}
