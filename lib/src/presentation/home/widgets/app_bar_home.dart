import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/assets.gen.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/di/di.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
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
      icon: const Icon(IconsaxOutline.menu_1),
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
        MyText.bodySmall(
          context,
          appLocal(context).hello,
        ),
        MyText.bodyLarge(
          context,
          '0xfabf232',
          isBold: true,
        )
      ],
    );
  }
}
