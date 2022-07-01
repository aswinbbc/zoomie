import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
          leading: Image(
            image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/2927/2927347.png"),
            // color: Colors.red,
          ),
          title: Text(_product.prodName!),
          trailing: CounterWidget(getCount: (count) {}),
        ),
      ).addNeumorphism(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, required this.getCount}) : super(key: key);
  final Function(int) getCount;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 1;

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
          child: Expanded(
            child: ElevatedButton(
                onPressed: () {
                  widget.getCount(_count);
                },
                child: Text("Add")),
          ),
        )
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
