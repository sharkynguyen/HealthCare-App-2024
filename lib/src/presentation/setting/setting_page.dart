import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/widgets/my_rounded_button.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/my_text_form_field.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/entity/personal_info.dart';
import 'package:health_care_app/src/presentation/calendar/widget/app_bar_calendar.dart';
import 'package:health_care_app/src/presentation/setting/store/setting_store.dart';
import 'package:health_care_app/src/presentation/setting/widget/app_bar_setting.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late TextEditingController _ageController;
  late TextEditingController _genderController;
  late TextEditingController _heartDeseaseController;
  late TextEditingController _otherDeseaseController;

  final _settingStore = injector.get<SettingStore>();

  @override
  void initState() {
    _ageController =
        TextEditingController(text: _settingStore.personalInfo.first.age);
    _genderController =
        TextEditingController(text: _settingStore.personalInfo.first.gender);
    _heartDeseaseController = TextEditingController(
        text: _settingStore.personalInfo.first.heartDesease);
    _otherDeseaseController = TextEditingController(
        text: _settingStore.personalInfo.first.otherDease);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      topPadding: 10,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarCalendar(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarSetting(),
              context.sizedBox(height: 40),
              MyTextField(
                icon: Icons.person,
                errorText: null,
                textController: _ageController,
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.man,
                errorText: null,
                textController: _genderController,
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.heart_broken,
                errorText: null,
                textController: _heartDeseaseController,
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.description,
                errorText: null,
                textController: _otherDeseaseController,
              ),
              context.sizedBox(height: 20),
              Center(
                child: RoundedButton.textAndCustomIcon(
                    context,
                    'Update',
                    Icons.update,
                    () => _settingStore.updatePersonInfo(PersonalInfo(
                          age: _ageController.text,
                          gender: _genderController.text,
                          heartDesease: _heartDeseaseController.text,
                          otherDease: _otherDeseaseController.text,
                          heart: _settingStore.heartRate,
                          oxygen: _settingStore.oxygen,
                        ))),
              ),
              context.sizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
