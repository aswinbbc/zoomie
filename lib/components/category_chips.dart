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
    return Row(
      children: [
        FutureBuilder(
          future: getCategories(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> categories = snapshot.data!;
              return Expanded(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    children: List<Widget>.generate(
                      categories.length,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ChoiceChip(
                            avatar: const Image(
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/5141/5141534.png"),
                              // color: Colors.red,
                            ),
                            pressElevation: 0.0,
                            selectedColor: Colors.blue,
                            backgroundColor: Colors.grey[100],
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories.elementAt(index).pcName!,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
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
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RotatedBox(
            quarterTurns: 5,
            child: Text(
              "Categories",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: kGrayColor),
            ),
          ),
        ),
      ],
    );
  }
}
