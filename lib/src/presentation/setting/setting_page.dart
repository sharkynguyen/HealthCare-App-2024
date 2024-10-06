import 'package:auto_route/auto_route.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/presentation/calendar/widget/app_bar_calendar.dart';
import 'package:health_care_app/src/presentation/setting/widget/app_bar_setting.dart';
import 'package:health_care_app/src/presentation/setting/widget/setting_button_item.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      topPadding: 10,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarCalendar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarSetting(),
            context.sizedBox(height: 40),
            _buildTitleSetting(context, 'Chung'),
            context.sizedBox(height: 10),
            const SettingButtonItem(
              title: 'Thông tin cá nhân',
              iconData: IconsaxOutline.profile_circle,
            ),
            const SettingButtonItem(
              title: 'Thông tin thiết bị',
              iconData: IconsaxOutline.device_message,
            ),
            context.sizedBox(height: 20),
            _buildTitleSetting(context, 'Chung'),
            context.sizedBox(height: 10),
            const SettingButtonItem(
              title: 'Giao diện sáng/tối',
              iconData: IconsaxOutline.sun_1,
            ),
            const SettingButtonItem(
              title: 'Ngôn ngữ',
              iconData: IconsaxOutline.language_circle,
            ),
            context.sizedBox(height: 20),
            _buildTitleSetting(context, 'Chính sách'),
            context.sizedBox(height: 10),
            const SettingButtonItem(
              title: 'Quyền riêng tư',
              iconData: IconsaxOutline.shield,
            ),
            const SettingButtonItem(
              title: 'Liên hệ báo cáo',
              iconData: IconsaxOutline.call,
            ),
            context.sizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSetting(BuildContext context, String title) {
    return MyText.labelMedium(
      context,
      title,
      isBold: true,
    );
  }
}
