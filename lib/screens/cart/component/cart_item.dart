import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/extensions.dart';

import '../../../models/product.dart';
import '../../../models/provider_model/product_list.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard(
      {Key? key,
      required this.product,
      required this.index,
      required this.count,
      required this.onRemove,
      required this.onCountChange})
      : super(key: key);
  final Product product;
  final int index, count;
  final VoidCallback onRemove;
  final Function(int) onCountChange;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  late final Product _product;
  @override
  void initState() {
    _product = widget.product;
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
              '${double.parse(_product.retailPrice!)} x ${widget.count} = ${double.parse(_product.retailPrice!) * widget.count}'),
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

class CounterWidget extends StatefulWidget {
  const CounterWidget(
      {Key? key,
      required this.getCount,
      required this.defaultCount,
      required this.onRemove})
      : super(key: key);
  final Function(int) getCount;
  final VoidCallback onRemove;
  final int defaultCount;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _count;
  @override
  void initState() {
    super.initState();
    _count = widget.defaultCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Material(
            color: Colors.blue, // Button color
            child: InkWell(
              splashColor: Colors.red, // Splash color
              onTap: _decrement,
              child: const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.minus),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_count.toString()),
        ),
        ClipOval(
          child: Material(
            color: Colors.blue, // Button color
            child: InkWell(
              splashColor: Colors.red, // Splash color
              onTap: _increment,
              child: const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.plus,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
              onPressed: () {
                widget.getCount(_count);
              },
              child: Text("edit")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                Colors.red,
              )),
              onPressed: widget.onRemove,
              child: Text("remove")),
        ),
      ],
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count != 1) {
      setState(() {
        _count--;
      });
    }
  }
}