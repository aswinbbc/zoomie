import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:zoomie_kot/models/product.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/screens/cart/component/cart_item.dart';
import 'package:zoomie_kot/utils/actions.dart';
import 'package:zoomie_kot/utils/constant.dart';
import 'package:zoomie_kot/utils/print_fn.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isNetwork = true;

  @override
  void initState() {
    super.initState();
    getSharedPrefString("printer_type").then((value) {
      setState(() {
        isNetwork = value != "bluetooth";
      });
    });
  }

  ReceiptController? controller;

  String? address;

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  String ctime = DateFormat("hh:mm:ss a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsListModel>(builder: (context, productList, _) {
      return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 25.0),
        child: Stack(
          children: [
            Visibility(
              maintainInteractivity: true,
              // visible: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainSemantics: true,
              maintainState: true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
                  child: Receipt(
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Center(
                            child: Text(
                              'KOT PRINT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(thickness: 4),
                          Row(
                            children: [
                              const Text(
                                'Date:',
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '$cdate $ctime',
                              ),
                            ],
                          ),
                          const Divider(thickness: 4),
                          for (CartItem item in productList.productList)
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.product.prodName! +
                                        ' ' +
                                        item.product.narration,
                                  ),
                                ),
                                Text(
                                  item.quantity.toString(),
                                ),
                              ],
                            ),
                          const Divider(thickness: 4),
                          Row(
                            children: [
                              const Text(
                                'table name:',
                              ),
                              const SizedBox(width: 8),
                              Text(
                                Provider.of<Selection>(context).table,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'username:',
                              ),
                              const SizedBox(width: 8),
                              Text(
                                cdate,
                              ),
                            ],
                          ),
                          const Divider(thickness: 4),
                          const SizedBox(
                            width: 8,
                            height: 8,
                          ),
                          const Text(
                            '.',
                          ),
                        ],
                      );
                    },
                    onInitialized: (controller) {
                      this.controller = controller;
                    },
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
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
                  Expanded(
                    child: ListView.builder(
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
                              count: productList.productList
                                  .elementAt(index)
                                  .quantity,
                              index: index,
                              product: productList.productList
                                  .elementAt(index)
                                  .product);
                        });
                      },
                    ),
                  ),
                ],
              ),
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
                        onPressed: () async {
                          if (!isNetwork) {
                            final selectedAddress =
                                await getSharedPrefString("bluetooth_name");

                            selectedAddress.isNotEmpty
                                ? controller?.print(address: selectedAddress)
                                : showMessage("please select printer");
                          } else {
                            final kitchens = await getAllKitchens();
                            kitchens.forEach((kitchen) async {
                              List<CartItem> products = productList.productList
                                  .where((element) =>
                                      element.product.kitchenId ==
                                      kitchen.pknId)
                                  .toList();

                              products.isNotEmpty
                                  ? await printNetwork(products, selection,
                                      await getSharedPrefString(kitchen.pknId!))
                                  : null;
                            });
                          }
                          writeKOTMaster(
                                  selection.type,
                                  selection.carNo,
                                  selection.contactNo,
                                  selection.contactName,
                                  await Constants.userId,
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
                                    element.product.retailPrice.toString(),
                                    element.rowId,
                                    element.product.narration);
                                // print(result);
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
            ),
          ],
        ),
      );
    });
  }
}
