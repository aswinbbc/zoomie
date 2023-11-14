import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';
import 'package:zoomie_kot/models/sub_category.dart';

import '../models/all_lists.dart';
import '../utils/constants.dart';

class SubCategoryChips extends StatefulWidget {
  const SubCategoryChips({
    Key? key,
  }) : super(key: key);

  @override
  State<SubCategoryChips> createState() => _SubCategoryChipsState();
}

class _SubCategoryChipsState extends State<SubCategoryChips> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<IdModel>(builder: (context, categoryModel, child) {
      return Row(
        children: [
          FutureBuilder(
            future: getSubCategory(categoryModel.getCategoryId),
            builder: (context, AsyncSnapshot<List<SubCategory>> snapshot) {
              if (snapshot.hasData) {
                List<SubCategory> SubCategories = snapshot.data!;
                return Expanded(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12.0,
                      children: List<Widget>.generate(
                        SubCategories.length,
                        (int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ChoiceChip(
                              key: Key(
                                  '$index${SubCategories.elementAt(index).subCategoryName}'),
                              avatar: const Image(
                                image: NetworkImage(
                                    "https://i.pinimg.com/originals/dd/9d/c9/dd9dc9d83423bc037b511d73b29e6b80.png"),
                                // color: Colors.red,
                              ),
                              pressElevation: 0.0,
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.grey[100],
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  SubCategories.elementAt(index)
                                      .subCategoryName!,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              selected: _value == index,
                              onSelected: (bool selected) {
                                Provider.of<IdModel>(context, listen: false)
                                        .setSubCategoryId =
                                    SubCategories.elementAt(index)
                                        .idForDisplay
                                        .toString();
                                setState(() {
                                  _value = index;
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
                return CircularProgressIndicator();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 5,
            child: Text(
              "Sub Categories",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: kGrayColor),
            ),
          ),
        ],
      );
    });
  }
}
