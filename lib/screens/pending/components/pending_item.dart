import 'package:flutter/material.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/pending_details.dart';

import '../../cart/component/cart_item.dart';

class PendingItemCard extends StatefulWidget {
  const PendingItemCard(
      {Key? key,
      required this.pendingItemModel,
      required this.index,
      required this.count,
      required this.onRemove,
      required this.onCountChange})
      : super(key: key);
  final PendingItemModel pendingItemModel;
  final int index, count;
  final VoidCallback onRemove;
  final Function(int) onCountChange;

  @override
  State<PendingItemCard> createState() => _PendingItemCardState();
}

class _PendingItemCardState extends State<PendingItemCard> {
  late final PendingItemModel _product;
  @override
  void initState() {
    _product = widget.pendingItemModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: ListTile(
          // leading: const Image(
          //   image: NetworkImage(
          //       "https://cdn-icons-png.flaticon.com/512/2927/2927347.png"),
          //   // color: Colors.red,
          // ),
          title: Text(_product.prodName!),
          subtitle: Text(
              '${double.parse(_product.price!)} x ${widget.count} = ${double.parse(_product.price!) * widget.count}'),
          trailing: CounterWidget(
            defaultCount: widget.count,
            getCount: widget.onCountChange,
            onRemove: widget.onRemove,
          ),
        ),
      ).addNeumorphism(),
    );
  }
}
