import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final Widget widget;
  final String title;
  final Function() okClick;

  final double height;
  const CustomAlert(
      {Key? key,
      required this.widget,
      required this.title,
      required this.okClick,
      this.height = 200.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: height,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                widget,
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          okClick();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'ok',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
