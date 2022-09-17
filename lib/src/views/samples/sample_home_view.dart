import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/shared/widgets/buttons/basic_btn.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/country_dropdown_input_field.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/numeric_input_field.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/password_input_field.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/phone_input_field.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/text_area_input_field.dart';
import 'package:flutter_fire_starter/src/shared/widgets/forms/text_input_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SampleHomeView extends StatefulWidget {
  const SampleHomeView({Key? key}) : super(key: key);

  @override
  State<SampleHomeView> createState() => _SampleHomeViewState();
}

class _SampleHomeViewState extends State<SampleHomeView> {
  final GlobalKey<FormBuilderState> _sampleFormKey =
      GlobalKey<FormBuilderState>();

  String _appVersion = "";

  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Lists',
      icon: Icon(
        Icons.list,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];

  @override
  void didChangeDependencies() async {
    PackageInfo pkgInfos = await PackageInfo.fromPlatform();
    _appVersion = "V.${pkgInfos.version} build ${pkgInfos.buildNumber}";
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: _sampleFormKey,
                      child: Column(
                        children: <Widget>[
                          Text(_appVersion),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputField(
                            name: 'text',
                            labelText: 'Text Input',
                            hintText: 'hintText',
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'This field is required'),
                            ]),
                            onSaved: (value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          NumericInputField(
                            name: 'nemeric',
                            labelText: 'Numeric Input',
                            hintText: 'hintText',
                            onSaved: (value) {},
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CountryDropDownInputField(
                            name: 'country',
                            labelText: 'Country Dropdown',
                            hintText: 'hintText',
                            onChanged: (value) {},
                            initialFormValue: '',
                            isEnabled: false,
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'This field is required'),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PasswordInputField(
                            name: 'password',
                            labelText: 'Password Input',
                            hintText: 'hintText',
                            onSaved: (value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PhoneNumberInputField(
                            name: 'phone',
                            hintText: 'hintText',
                            labelText: 'Phone Number Input',
                            isEnabled: true,
                            onSaved: (value) {},
                            onChanged: (value) {},
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'This field is required'),
                              //FormBuilderValidators.min(context, 20, errorText: 'This field must be at least 20 characters long'),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextAreaInputField(
                            name: 'text area',
                            labelText: 'Text area Input',
                            hintText: 'hintText',
                            onSaved: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                BasicButton(
                  backgroundColor: HexColor(AppColors.primary),
                  borderColor: HexColor(AppColors.primary),
                  textColor: HexColor(AppColors.white),
                  btnText: 'Submit',
                  onPressed: () {
                    if (_sampleFormKey.currentState!.saveAndValidate()) {
                      if (kDebugMode) {
                        print(_sampleFormKey.currentState!.value);
                      }
                    } else {
                      if (kDebugMode) {
                        print(
                            'Form is not valid ${_sampleFormKey.currentState!.value}');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        selectedItemColor: HexColor(
          AppColors.primary,
        ),
        unselectedItemColor: HexColor(
          AppColors.darkGray,
        ),
        selectedIconTheme: IconThemeData(
          color: HexColor(
            AppColors.primary,
          ),
        ),
        unselectedIconTheme: IconThemeData(
          color: HexColor(
            AppColors.darkGray,
          ),
        ),
      ),
    );
  }
}
