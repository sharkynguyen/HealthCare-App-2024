import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/home/widgets/container_sensor_data.dart';

class DataSensor extends StatelessWidget {
  const DataSensor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: ContainerSensorData(
            title: appLocal(context).heartRate,
            iconData: IconsaxOutline.heart_tick,
            value: '120',
            unit: Constants.heartRateUnit,
            colorDataSensor: colorScheme(context).error,
          ),
        ),
        context.sizedBox(width: 12),
        Expanded(
          flex: 1,
          child: ContainerSensorData(
            title: appLocal(context).oxygen,
            iconData: IconsaxOutline.notification_circle,
            value: '50',
            unit: Constants.oxygenUnit,
            colorDataSensor: colorScheme(context).primary,
          ),
        )
      ],
    );
  }
}
