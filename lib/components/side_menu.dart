import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zoomie_kot/screens/pending/pending_screen.dart';

import '../models/provider_model/selection.dart';
import '/responsive.dart';
import '../utils/constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tables.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'take_away.dart';

class SideMenu extends StatefulWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);
  static List<Widget> items = [
    Tables(),
    const TakeAway(),
    const PendingScreen()
  ];
  final username = "aswin.T";

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Card(
                color: kBgLightColor,
                child: ListTile(
                  title: Text("name : ${widget.username}"),
                  trailing: Wrap(children: [
                    if (!Responsive.isDesktop(context)) CloseButton(),
                  ]),
                ),
              ),
              SideMenuItem(
                press: () {
                  Provider.of<Selection>(context, listen: false).setType =
                      "Dining";

                  setState(() {
                    selectedIndex = 0;
                  });
                },
                title: "Dining",
                iconSrc: "assets/Icons/food.svg",
                isActive: selectedIndex == 0,
              ),
              SideMenuItem(
                press: () {
                  Provider.of<Selection>(context, listen: false).setType =
                      "Take away";

                  setState(() {
                    selectedIndex = 1;
                  });
                },
                title: "Take away",
                iconSrc: "assets/Icons/Send.svg",
                isActive: selectedIndex == 1,
              ),
              SideMenuItem(
                press: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                title: "Pending",
                iconSrc: "assets/Icons/File.svg",
                isActive: selectedIndex == 2,
              ),
              SizedBox(height: kDefaultPadding * 2),
              SideMenu.items[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }
}
