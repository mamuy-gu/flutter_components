import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'app_drawer.dart';
import 'widgets/progress_indicator.dart' as pi;

class ReactiveFormPage extends StatelessWidget {
  const ReactiveFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поля'),
      ),
      drawer: const AppDrawer(),
      body: _Form(),
    );
  }
}

class _Form extends StatelessWidget {
  FormGroup buildForm() => fb.group({
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
          //asyncValidators: []
        ),
        'password': ['', Validators.required, Validators.minLength(8)],
        'passwordConfirmation': '',
        'rememberMe': false,
        'progress': [50.0, Validators.min(50.0)],
        'dateTime': DateTime.now(),
        'time': TimeOfDay.now(),
      }, [
        Validators.mustMatch('password', 'passwordConfirmation')
      ]);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: buildForm,
      builder: (context, formGroup, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReactiveTextField(
                  formControlName: 'email',
                  validationMessages: {
                    ValidationMessage.required: 'The email must not be empty',
                    ValidationMessage.email:
                        'The email value must be a valid email',
                    'unique': 'This email is already in use',
                  },
                  onSubmitted: () => formGroup.focus('password'),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    suffixIcon: ReactiveStatusListenableBuilder(
                      formControlName: 'email',
                      builder: (context, control, child) => Visibility(
                        child: pi.ProgressIndicator(),
                        visible: control.pending,
                      ),
                    ),
                  ),
                ),
                ReactiveTextField(
                  formControlName: 'password',
                  obscureText: true,
                  validationMessages: {
                    ValidationMessage.required:
                    'The password must not be empty',
                    ValidationMessage.minLength:
                    'The password must be at least 8 characters',
                  },
                  onSubmitted: () => formGroup.focus('passwordConfirmation'),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                ReactiveTextField(
                  formControlName: 'passwordConfirmation',
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validationMessages: {
                    ValidationMessage.mustMatch:
                    'Password confirmation must match',
                  },
                  onSubmitted: () => formGroup.focus('rememberMe'),
                  textInputAction: TextInputAction.next,
                ),
                ReactiveFormConsumer(
                  builder: (context, form, child) => RaisedButton(
                    child: Text('Sign Up'),
                    onPressed: form.valid ? () => print(form.value) : null,
                  ),
                ),
                RaisedButton(
                  child: Text('Reset all'),
                  onPressed: () => formGroup.resetState({
                    'email': ControlState(value: 'johnDoe', disabled: true),
                    'progress': ControlState(value: 50.0),
                    'rememberMe': ControlState(value: false),
                  }, removeFocus: true),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReactiveSwitch(formControlName: 'rememberMe'),
                    ReactiveCheckbox(formControlName: 'rememberMe'),
                  ],
                ),
                ReactiveDropdownField<bool>(
                  formControlName: 'rememberMe',
                  hint: Text('Want to stay logged in?'),
                  decoration: InputDecoration(labelText: 'Remember me'),
                  items: [
                    DropdownMenuItem(value: true, child: Text('Yes')),
                    DropdownMenuItem(value: false, child: Text('No')),
                  ],
                ),
                ReactiveRadioListTile(
                  formControlName: 'rememberMe',
                  title: Text('Remember me'),
                  value: true,
                ),
                ReactiveRadioListTile(
                  formControlName: 'rememberMe',
                  title: Text('Don\'t Remember me'),
                  value: false,
                ),
                SizedBox(height: 24.0),
                ReactiveValueListenableBuilder<double>(
                  formControlName: 'progress',
                  builder: (context, control, child) => Text(control.isNull
                      ? 'Progress not set'
                      : 'Progress set to ${control.value.toStringAsFixed(2)}%'),
                ),
                ReactiveSlider(
                  formControlName: 'progress',
                  max: 100,
                  divisions: 100,
                  labelBuilder: (value) => '${value?.toStringAsFixed(2)}%',
                ),
                SizedBox(height: 24.0),
                ReactiveTextField(
                  formControlName: 'progress',
                  keyboardType: TextInputType.number,
                  validationMessages: {
                    ValidationMessage.min:
                    'A value lower than 50.00 is not accepted',
                  },
                ),
                SizedBox(height: 24.0),
                ReactiveTextField(
                  formControlName: 'dateTime',
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    suffixIcon: ReactiveDatePicker(
                      formControlName: 'dateTime',
                      firstDate: DateTime(1985),
                      lastDate: DateTime(2030),
                      builder: (context, picker, child) {
                        return IconButton(
                          onPressed: picker.showPicker,
                          icon: Icon(Icons.date_range),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ReactiveTextField(
                  formControlName: 'time',
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Birthday time',
                    suffixIcon: ReactiveTimePicker(
                      formControlName: 'time',
                      builder: (context, picker, child) {
                        return IconButton(
                          onPressed: picker.showPicker,
                          icon: Icon(Icons.access_time),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
