import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zoomie_kot/screens/pending/pending_screen.dart';
import 'package:zoomie_kot/utils/actions.dart';
import 'package:zoomie_kot/utils/constant.dart';

import '../models/provider_model/selection.dart';
import '/responsive.dart';
import '../utils/constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tables.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'take_away.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var selectedIndex = 0;
  String username = "";
  static List<Widget> items = [
    Tables(),
    const TakeAway(),
    const PendingScreen(),
    Tables(),
  ];

  @override
  void initState() {
    Constants.userName.then((value) {
      setState(() {
        username = value;
      });
    });
    super.initState();
  }

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
                  title: Text("name : ${username}"),
                  trailing: Wrap(children: [
                    if (!Responsive.isDesktop(context)) CloseButton(),
                  ]),
                ),
              ),
              SideMenuItem(
                press: () {
                  newOrder(context);
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                title: "New / Clear",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: selectedIndex == 3,
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
              items[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }
}
