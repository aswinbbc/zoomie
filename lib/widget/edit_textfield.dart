import 'package:flutter/material.dart';

class EditTextField extends StatefulWidget {
  TextEditingController controller;
  EditTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  bool _isEnable = false;
//These are initialize at the top

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: _isEnable ? null : InputBorder.none,
            ),
            controller: widget.controller,
            enabled: _isEnable,
          ),
        ),
        IconButton(
            color: Colors.green,
            icon: Icon(_isEnable ? Icons.done : Icons.edit),
            onPressed: () {
              setState(() {
                _isEnable = !_isEnable;
              });
            })
      ],
    );
  }
}
