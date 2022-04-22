import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  List<String> datas;
  Function(String) onSelected;
  MyDropDown({Key? key, required this.datas, required this.onSelected})
      : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String? selectedValue;
  @override
  void initState() {
    selectedValue = widget.datas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      items: widget.datas.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (changedValue) {
        widget.onSelected(changedValue!);
        setState(() {
          selectedValue = changedValue;
        });
      },
    );
  }
}
