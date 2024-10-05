import 'package:auto_route/auto_route.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/assets.gen.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/normal_body.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        useAppBar: true,
        titleWidget: Row(
          children: [
            CircleAvatar(
              radius: context.sizeWidth(25),
              child: Assets.icons.avatar.image(),
            ),
            context.sizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Xin chao'),
                NormalBody(str: '0xff923823'),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(IconsaxOutline.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: const Column(
          children: [
            Row(
              children: [
                Text('Thong so'),
              ],
            )
          ],
        ));
  }
}
