import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/components/actions.dart';
import 'package:zoomie_kot/models/product.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/screens/cart/component/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsListModel>(builder: (context, productList, _) {
      return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 25.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Cart',
                  maxLines: 20,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
                  itemCount: productList.count,
                  itemBuilder: (context, index) {
                    return Consumer<ProductsListModel>(
                        builder: (context, productList, child) {
                      return CartProductCard(
                          onCountChange: ((count) {
                            productList.edit(
                                index,
                                productList.productList
                                    .elementAt(index)
                                    .product,
                                count);
                          }),
                          onRemove: () {
                            productList.deleteById(index);
                          },
                          count:
                              productList.productList.elementAt(index).quantity,
                          index: index,
                          product:
                              productList.productList.elementAt(index).product);
                    });
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.blueGrey,
                child: Consumer<Selection>(builder: (context, selection, _) {
                  return ListTile(
                    title: const Text("Total amount:"),
                    subtitle: Text("${productList.total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black)),
                    trailing: ElevatedButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          writeKOTMaster(
                                  selection.type,
                                  selection.carNo,
                                  selection.contactNo,
                                  selection.contactName,
                                  "1",
                                  productList.total.toString(),
                                  selection.table)
                              .then((value) {
                            productList.productList.forEach((element) async {
                              try {
                                final result = await writeKOTMasterDetails(
                                    value,
                                    "1",
                                    element.product.prodId.toString(),
                                    element.quantity.toString(),
                                    element.product.retailPrice.toString());
                                print(result);
                              } finally {
                                productList.deleteById(
                                    productList.productList.indexOf(element));
                              }
                            });
                          });
                        }),
                  );
                }),
              ),
            )
          ],
        ),
      );
    });
  }
}
