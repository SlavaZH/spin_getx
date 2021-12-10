import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    required this.onSaveHandler,
    this.color = Colors.blue,
    Key? key
  }) : super(key: key);

  final void Function() onSaveHandler;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSaveHandler,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'Save',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
