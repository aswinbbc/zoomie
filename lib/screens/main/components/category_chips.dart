import 'package:flutter/material.dart';
import 'package:zoomie_kot/extensions.dart';

import '../../../models/all_lists.dart';
import '../../../utils/constants.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({Key? key}) : super(key: key);

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
              // SizedBox(width: kDefaultPadding / 4),

              Text(
                "Categories",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: kGrayColor),
              ),
            ],
          ),
          FutureBuilder(
            future: getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  children: List<Widget>.generate(
                    5,
                    (int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ChoiceChip(
                          pressElevation: 0.0,
                          selectedColor: Colors.blue,
                          backgroundColor: Colors.grey[100],
                          label: Text(
                            "My Custom $index",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : -1;
                            });
                          },
                        ).addNeumorphism(),
                      );
                    },
                  ).toList(),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
