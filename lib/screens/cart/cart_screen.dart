import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/screens/cart/component/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsListModel>(builder: (context, productList, _) {
      return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cart',
              maxLines: 20,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: productList.count,
              itemBuilder: (context, index) {
                return CartProductCard(
                    count: productList.productList.elementAt(index).quantity,
                    index: index,
                    product: productList.productList.elementAt(index).product);
              },
            ),
          ],
        ),
      );
    });
  }
}
