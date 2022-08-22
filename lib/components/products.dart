import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/components/modifier.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/modifier_model.dart';
import 'package:zoomie_kot/models/product.dart';
import 'package:zoomie_kot/utils/actions.dart';
import 'package:zoomie_kot/widget/custom_alert.dart';
import 'package:zoomie_kot/widget/product_card.dart';

import '../models/all_lists.dart';
import '../models/provider_model/id_model.dart';
import '../models/provider_model/product_list.dart';
import '../models/sub_category.dart';
import '../utils/constants.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  int? _value = 0;

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
                    controller: ScrollController(),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12.0,
                        children: List<Widget>.generate(
                          products.length,
                          (int index) {
                            Product _product = products.elementAt(index);
                            // print(_product.prodName);
                            return ListTile(
                              leading: const Image(
                                image: NetworkImage(
                                    "https://cdn-icons-png.flaticon.com/512/2927/2927347.png"),
                                // color: Colors.red,
                              ),
                              title: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                runSpacing: 10,
                                spacing: 20,
                                children: [
                                  Text(_product.prodName!),
                                  CounterWidget(getCount: (count) async {
                                    List<ModifierModel> modifiers =
                                        await getModifier(_product.prodId!);
                                    if (modifiers.isEmpty) {
                                      Provider.of<ProductsListModel>(context,
                                              listen: false)
                                          .add(_product, count);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomAlert(
                                            widget: Modifier(
                                              modifiers: modifiers,
                                            ),
                                            title: "Modifier",
                                            okClick: () {}),
                                      );
                                    }
                                  }),
                                ],
                              ),
                              subtitle: Text(
                                  'QR.${double.parse(_product.retailPrice!).toStringAsFixed(2)}'),
                              // trailing:
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
