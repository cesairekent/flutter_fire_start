import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/view_models/sample_view_model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SampleFormView extends StatefulWidget
{
  const SampleFormView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SampleFormView> createState() => _SampleFormPageState();
}

class _SampleFormPageState extends State<SampleFormView>
{
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> genderOptions = ['Male', 'Female', 'Óther'];

  @override
  Widget build(BuildContext context) {
    var sampleForm = context.watch<SampleVM>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                autoFocusOnValidationFailure: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderFilterChip(
                      name: 'filter_chip',
                      decoration: InputDecoration(
                        labelText: 'Select many options',
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Test',
                          child: Text('Test'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 1',
                          child: Text('Test 1'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 2',
                          child: Text('Test 2'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 3',
                          child: Text('Test 3'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 4',
                          child: Text('Test 4'),
                        ),
                      ],
                    ),
                    FormBuilderChoiceChip(
                      name: 'choice_chip',
                      decoration: InputDecoration(
                        labelText: 'Select an option',
                      ),
                      options: [
                        FormBuilderFieldOption(
                          value: 'Test',
                          child: Text('Test'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 1',
                          child: Text('Test 1'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 2',
                          child: Text('Test 2'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 3',
                          child: Text('Test 3'),
                        ),
                        FormBuilderFieldOption(
                          value: 'Test 4',
                          child: Text('Test 4'),
                        ),
                      ],
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      // onChanged: _onChanged,
                      inputType: InputType.time,
                      decoration: InputDecoration(
                        labelText: 'Appointment Time',
                      ),
                      initialTime: TimeOfDay(hour: 8, minute: 0),
                      // initialValue: DateTime.now(),
                      // enabled: true,
                    ),
                    FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                      format: DateFormat('yyyy-MM-dd'),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: 'Date Range',
                        helperText: 'Helper text',
                        hintText: 'Hint text',
                      ),
                    ),
                    FormBuilderSlider(
                      name: 'slider',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.min(context, 6),
                      ]),
                      onChanged: (value) {},
                      min: 0.0,
                      max: 10.0,
                      initialValue: 7.0,
                      divisions: 20,
                      activeColor: Colors.red,
                      inactiveColor: Colors.pink[100],
                      decoration: InputDecoration(
                        labelText: 'Number of things',
                      ),
                    ),
                    FormBuilderCheckbox(
                      name: 'accept_terms',
                      initialValue: false,
                      onChanged: (value) {},
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I have read and agree to the ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      validator: FormBuilderValidators.equal(
                        context,
                        true,
                        errorText:
                            'You must accept terms and conditions to continue',
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'age',
                      decoration: InputDecoration(
                        labelText:
                            'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderDropdown(
                      name: 'gender',
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                      // initialValue: 'Male',
                      allowClear: true,
                      hint: Text('Select Gender'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text('$gender'),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          print(_formKey.currentState?.value);
                        } else {
                          print("validation failed");
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
