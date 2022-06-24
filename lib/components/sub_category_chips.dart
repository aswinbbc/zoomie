import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';
import 'package:zoomie_kot/models/sub_category.dart';

import '../models/all_lists.dart';
import '../models/category.dart';
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
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //     // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
              //     // SizedBox(width: kDefaultPadding / 4),

              Text(
                "Sub Categories",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kGrayColor),
              ),
            ],
          ),
          FutureBuilder(
            future: getSubCategory(categoryModel.getCategoryId),
            builder: (context, AsyncSnapshot<List<SubCategory>> snapshot) {
              if (snapshot.hasData) {
                List<SubCategory> categories = snapshot.data!;
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
                                  categories.elementAt(index).subCategoryName!,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                selected: _value == index,
                                onSelected: (bool selected) {
                                  print("sub c :" +
                                      categories
                                          .elementAt(index)
                                          .categId
                                          .toString());
                                  Provider.of<IdModel>(context, listen: false)
                                          .setSubCategoryId =
                                      categories
                                          .elementAt(index)
                                          .categId
                                          .toString();
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
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      );
    });
  }
}
