import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/components/products.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/screens/cart/cart_screen.dart';
import 'package:zoomie_kot/screens/selection/selection_screen.dart';
import '../../components/sub_category_chips.dart';
import '/components/side_menu.dart';
import '/responsive.dart';
import '../../components/category_chips.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _widgets = [const SelectionScreen(), CartScreen()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      body: SafeArea(
        child: Responsive(
          // Let's work on our mobile part
          mobile: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: _widgets.elementAt(selectedIndex),
            ),
            if (!Responsive.isDesktop(context))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.menu),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: const Icon(FontAwesomeIcons.cartShopping),
                      onPressed: () {
                        setState(() {
                          selectedIndex = selectedIndex == 0 ? 1 : 0;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: -12.0,
                    right: -8.0,
                    child: Consumer<ProductsListModel>(
                      builder: (context, value, child) => Chip(
                        label: Text(value.count.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68.0),
              child: Consumer<Selection>(builder: (context, selection, _) {
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '${selection.type} # ${selection.type == 'Dining' ? 'Table : ' + selection.table : 'Car No : ' + selection.carNo}'),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ]),
          tablet: Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        Expanded(child: CategoryChips()),
                        Expanded(child: SubCategoryChips()),
                      ],
                    ),
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    selectedIndex == 0 ? const ProductsWidget() : CartScreen(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                child:
                                    const Icon(FontAwesomeIcons.cartShopping),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = selectedIndex == 0 ? 1 : 0;
                                  });
                                },
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Consumer<ProductsListModel>(
                                builder: (context, value, child) => Chip(
                                  label: Text(value.count.toString()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 5,
              //   child: Placeholder(),
              // ),
            ],
          ),
          desktop: Row(
            children: [
              // Once our width is less then 1300 then it start showing errors
              // Now there is no error if our width is less then 1340
              Expanded(
                flex: _size.width > 1340 ? 2 : 5,
                child: const SideMenu(),
              ),
              Expanded(
                flex: _size.width > 1340 ? 3 : 6,
                child: Column(children: const [
                  Expanded(
                    child: CategoryChips(),
                  ),
                  Expanded(
                    child: SubCategoryChips(),
                  ),
                ]),
              ),
              Expanded(
                flex: _size.width > 1340 ? 8 : 8,
                child: const ProductsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
