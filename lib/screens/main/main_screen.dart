import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:zoomie_kot/components/products.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/all_lists.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';
import '../../components/sub_category_chips.dart';
import '../../utils/constants.dart';
import '/components/side_menu.dart';
import '/responsive.dart';
import '/screens/sample/email_screen.dart';
import '../../components/category_chips.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Responsive(
        // Let's work on our mobile part
        mobile: Stack(children: [
          Column(
            children: [
              Expanded(child: CategoryChips()),
              Expanded(child: SubCategoryChips()),
              Expanded(child: ProductsWidget()),
            ],
          ),
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                // elevation: 0.05,
                // backgroundColor: Colors.transparent,
                child: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                child: const Icon(FontAwesomeIcons.cartShopping),
                onPressed: () {},
              ),
            ),
          )
        ]),
        tablet: Row(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: CategoryChips()),
                      Expanded(child: SubCategoryChips()),
                    ],
                  ),
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: ProductsWidget(),
            ),
            Expanded(
              flex: 5,
              child: Placeholder(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 5,
              child: SideMenu(),
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
              child: ProductsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
