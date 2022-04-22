import 'package:flutter/material.dart';

class CounterTextField extends StatefulWidget {
  int count;
  TextEditingController controller;
  CounterTextField({Key? key, this.count = 0, required this.controller})
      : super(key: key);

  @override
  _CounterTextFieldState createState() => _CounterTextFieldState();
}

class _CounterTextFieldState extends State<CounterTextField> {
  @override
  void initState() {
    widget.controller.text = widget.count.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (int.parse(widget.controller.text) > 0) {
                  widget.controller.text =
                      (int.parse(widget.controller.text) - 1).toString();
                }
              });
            },
            color: Colors.green,
          ),
          Expanded(
            child: TextField(
              enabled: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              controller: widget.controller,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          IconButton(
            iconSize: 50,
            icon: Icon(
              Icons.add,
            ),
            color: Colors.green,
            onPressed: () {
              setState(() {
                widget.controller.text =
                    (int.parse(widget.controller.text) + 1).toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
