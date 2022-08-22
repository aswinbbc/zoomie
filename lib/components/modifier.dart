import 'package:flutter/material.dart';
import 'package:zoomie_kot/models/modifier_model.dart';

class Modifier extends StatefulWidget {
  final List<ModifierModel> modifiers;
  const Modifier({Key? key, required this.modifiers}) : super(key: key);

  @override
  State<Modifier> createState() => _ModifierState();
}

class _ModifierState extends State<Modifier> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text(widget.modifiers.elementAt(index).modifierName!),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : 0;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
