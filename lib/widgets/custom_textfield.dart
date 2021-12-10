import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.onChangeHandler,
    this.initValue,
    Key? key
  }) : super(key: key);

  final String? initValue;
  final void Function(String? value) onChangeHandler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      maxLength: 2,
      onChanged: (value) => onChangeHandler(value),
      initialValue: initValue,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35,
      ),
      decoration: InputDecoration(hintText: 'Enter item index'),
      keyboardType: TextInputType.number,
    );
  }
}
