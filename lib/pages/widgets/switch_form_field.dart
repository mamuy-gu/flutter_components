import 'package:flutter/material.dart';

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
    Key key,
    bool initialValue,
    this.decoration = const InputDecoration(),
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    this.onChanged,
    this.constraints = const BoxConstraints(),
  })  : assert(decoration != null),
        assert(initialValue != null),
        assert(constraints != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          builder: (state) {
            final effectiveDecoration = decoration.applyDefaults(
              Theme.of(state.context).inputDecorationTheme,
            );
            return InputDecorator(
              decoration: effectiveDecoration.copyWith(
                errorText: state.errorText,
              ),
              isEmpty: state.value == null,
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: constraints,
                    child: Switch(
                      value: state.value,
                      onChanged: state.didChange,
                    ),
                  ),
                ],
              ),
            );
          },
        );

  final ValueChanged<bool> onChanged;
  final InputDecoration decoration;
  final BoxConstraints constraints;

  @override
  FormFieldState<bool> createState() => _SwitchFormFieldState();
}

class _SwitchFormFieldState extends FormFieldState<bool> {
  @override
  SwitchFormField get widget => super.widget;

  @override
  void didChange(bool value) {
    super.didChange(value);
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
