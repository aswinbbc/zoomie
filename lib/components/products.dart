import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/product.dart';

import '../models/all_lists.dart';
import '../models/provider_model/id_model.dart';
import '../models/sub_category.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<IdModel>(builder: (context, idModel, child) {
      print(idModel.getSubCategoryId);
      return Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
          //     // SizedBox(width: kDefaultPadding / 4),

          //     // Text(
          //     //   "Sub Categories",
          //     //   style: Theme.of(context)
          //     //       .textTheme
          //     //       .headline6!
          //     //       .copyWith(color: kGrayColor),
          //     // ),
          //   ],
          // ),
          FutureBuilder(
            future: getProduct(idModel.getSubCategoryId),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data!;
                return Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12.0,
                        children: List<Widget>.generate(
                          products.length,
                          (int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: ChoiceChip(
                                pressElevation: 0.0,
                                selectedColor: Colors.blue,
                                backgroundColor: Colors.grey[100],
                                label: Text(
                                  products.elementAt(index).prodName!,
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
