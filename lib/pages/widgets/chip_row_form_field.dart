import 'package:flutter/material.dart';

import 'chips_row.dart';

class ChipsRowFormField extends FormField<List<String>> {

  ChipsRowFormField({
    FormFieldSetter<List<String>> onSaved,
    FormFieldValidator<List<String>> validator,
    List<String> initialValue = const [],
    bool autovalidate = false,
    InputDecoration decoration,
    GestureTapCallback onTap,
    this.onChanged,
    FocusNode focusNode,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (state) {
            final currentFocusNode = focusNode ?? FocusNode();
            return AnimatedBuilder(
              animation: Listenable.merge(<Listenable>[ currentFocusNode ]),
              builder: (context, child) {
                return InputDecorator(
                  decoration: decoration.copyWith(
                    errorText: state.errorText,
                  ),
                  isFocused: currentFocusNode.hasFocus,
                  isEmpty: initialValue.isEmpty,
                  child: child,
                );
              },
              child: ChipsRow(
                items: initialValue,
                onTap: onTap,
              ),
            );
          });

  final ValueChanged<List<String>> onChanged;

  @override
  FormFieldState<List<String>> createState() => _ChipsRowFormFieldState();
}

class _ChipsRowFormFieldState extends FormFieldState<List<String>> {

  @override
  ChipsRowFormField get widget => super.widget;

  @override
  void didChange(List<String> value) {
    super.didChange(value);
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}