import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/assets.gen.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/di/di.dart';

class AppBarSetting extends StatefulWidget {
  const AppBarSetting({super.key});

  @override
  State<AppBarSetting> createState() => _AppBarSettingState();
}

class _AppBarSettingState extends State<AppBarSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(),
        context.sizedBox(width: 10),
        _buildTitle(),
        const Spacer(),
        _buildMenu(),
      ],
    );
  }

  Widget _buildMenu() {
    return IconButton(
      icon: const Icon(IconsaxOutline.profile_tick),
      onPressed: () {},
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: context.sizeWidth(22),
      child: Assets.icons.avatar.image(),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText.bodySmall(context, 'Normal User'),
        MyText.bodyLarge(
          context,
          '0xfabf232',
          isBold: true,
        )
      ],
    );
  }
}
