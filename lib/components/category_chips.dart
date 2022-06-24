import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';

import '../models/all_lists.dart';
import '../models/category.dart';
import '../utils/constants.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({Key? key}) : super(key: key);

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
        //     // SizedBox(width: kDefaultPadding / 4),

        //     Text(
        //       "Categories",
        //       style: Theme.of(context)
        //           .textTheme
        //           .headline6!
        //           .copyWith(color: kGrayColor),
        //     ),
        //   ],
        // ),
        FutureBuilder(
          future: getCategories(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> categories = snapshot.data!;
              return Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12.0,
                      children: List<Widget>.generate(
                        categories.length,
                        (int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ChoiceChip(
                              pressElevation: 0.0,
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.grey[100],
                              label: Text(
                                categories.elementAt(index).pcName!,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              selected: _value == index,
                              onSelected: (bool selected) {
                                // print(categories.elementAt(index).pcId);
                                Provider.of<IdModel>(context, listen: false)
                                        .setCategoryId =
                                    categories.elementAt(index).pcId.toString();
                                setState(() {
                                  _value = selected ? index : -1;
                                });
                              },
                            ).addNeumorphism(),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}