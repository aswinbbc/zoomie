import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/product.dart';
import 'package:zoomie_kot/widget/product_card.dart';

import '../models/all_lists.dart';
import '../models/provider_model/id_model.dart';
import '../models/sub_category.dart';
import '../utils/constants.dart';

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
      return Row(
        children: [
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
                            return ProductCard(
                                product: products.elementAt(index));
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
          RotatedBox(
            quarterTurns: 5,
            child: Text(
              "Products",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: kGrayColor),
            ),
          ),
        ],
      );
    });
  }
}
