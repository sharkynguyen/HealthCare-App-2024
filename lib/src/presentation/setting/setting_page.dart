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
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _heartDeseaseController;
  late TextEditingController _otherDeseaseController;
  bool _isPlayingSports = false;
  String? _selectedGender;
  String? _selectedSport;

  final List<String> _sports = ['Football', 'Basketball', 'Tennis', 'Other'];

  final _settingStore = injector.get<SettingStore>();

  @override
  void initState() {
    _ageController =
        TextEditingController(text: _settingStore.personalInfo.first.age);
    _weightController = TextEditingController(text: '30');
    _heightController = TextEditingController(text: '190');
    _selectedGender = _settingStore.personalInfo.first.gender;
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
                hint: 'Age',
              ),
              context.sizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.man, color: Theme.of(context).primaryColor),
                  context.sizedBox(width: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _selectedGender == 'Male',
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedGender = 'Male';
                            } else {
                              _selectedGender = null; // Uncheck
                            }
                          });
                        },
                      ),
                      const Text('Male'),
                      context.sizedBox(width: 20),
                      Checkbox(
                        value: _selectedGender == 'Female',
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedGender = 'Female';
                            } else {
                              _selectedGender = null; // Uncheck
                            }
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                ],
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.monitor_weight,
                errorText: null,
                textController: _weightController,
                hint: 'Weight',
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.height,
                errorText: null,
                textController: _heightController,
                hint: 'Height',
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.heart_broken,
                errorText: null,
                textController: _heartDeseaseController,
                hint: 'Heart Desease',
              ),
              context.sizedBox(height: 10),
              MyTextField(
                icon: Icons.description,
                errorText: null,
                textController: _otherDeseaseController,
                hint: 'Other Desease',
              ),
              context.sizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _isPlayingSports,
                    onChanged: (value) {
                      setState(() {
                        _isPlayingSports = value!;
                      });
                    },
                  ),
                  const Text('Do you play sports?'),
                ],
              ),
              if (_isPlayingSports) ...[
                Row(
                  children: [
                    Icon(Icons.sports_soccer_sharp,
                        color: Theme.of(context).primaryColor),
                    context.sizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedSport,
                        hint: const Text('Select Sport'),
                        items: _sports.map((String sport) {
                          return DropdownMenuItem<String>(
                            value: sport,
                            child: Text(sport),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSport = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                context.sizedBox(height: 10),
                MyTextField(
                  icon: Icons.fitness_center,
                  errorText: null,
                  textController: TextEditingController(),
                  hint: 'Level',
                ),
              ],
              context.sizedBox(height: 30),
              Center(
                child: RoundedButton.textAndCustomIcon(
                  context,
                  'Update',
                  Icons.update,
                  () => _settingStore.updatePersonInfo(
                    PersonalInfo(
                      age: _ageController.text,
                      // weight: _weightController.text,
                      // height: _heightController.text,
                      gender: _selectedGender,
                      heartDesease: _heartDeseaseController.text,
                      otherDease: _otherDeseaseController.text,
                      heart: _settingStore.heartRate,
                      oxygen: _settingStore.oxygen,
                      // isPlayingSports: _isPlayingSports,
                      // sport: _selectedSport,
                    ),
                  ),
                ),
              ),
              context.sizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
