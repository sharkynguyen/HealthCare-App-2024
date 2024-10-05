import 'package:auto_route/auto_route.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/core/widgets/rounded_button.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/home/widgets/app_bar_home.dart';
import 'package:health_care_app/src/presentation/home/widgets/data_sensor.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      useAppBar: true,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarHome(),
      body: Column(
        children: [
          _buildTitleDatSensor(context),
          context.sizedBox(height: 20),
          const DataSensor(),
        ],
      ),
    );
  }

  Widget _buildTitleDatSensor(BuildContext context) {
    return Row(
      children: [
        MyText.labelMedium(
          context,
          appLocal(context).data,
          isBold: true,
        ),
        const Spacer(),
        RoundedButton(
          buttonColor: colorScheme(context).primary,
          textColor: colorScheme(context).surface,
          onPressed: () {},
          widget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText.bodySmall(
                context,
                appLocal(context).today,
              ),
              const Icon(IconsaxOutline.arrow_2)
            ],
          ),
        ),
      ],
    );
  }
}
