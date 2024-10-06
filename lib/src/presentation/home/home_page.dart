import 'package:auto_route/auto_route.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/core/widgets/my_rounded_button.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/home/widgets/app_bar_home.dart';
import 'package:health_care_app/src/presentation/home/widgets/averange_week_chart.dart';
import 'package:health_care_app/src/presentation/home/widgets/data_sensor.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      topPadding: 10,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarHome(),
            context.sizedBox(height: 40),
            _buildTitleDatSensor(context, appLocal(context).data),
            context.sizedBox(height: 20),
            const DataSensor(),
            context.sizedBox(height: 20),
            _buildTitleDatSensor(context, appLocal(context).chart),
            AverangeWeekChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleDatSensor(BuildContext context, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText.labelMedium(
          context,
          title,
          isBold: true,
        ),
        const Spacer(),
        RoundedButton.textAndDownArrow(
          context,
          appLocal(context).today,
        ),
      ],
    );
  }
}
