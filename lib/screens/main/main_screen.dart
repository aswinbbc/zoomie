import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/all_lists.dart';
import '../../utils/constants.dart';
import '/components/side_menu.dart';
import '/responsive.dart';
import '/screens/email/email_screen.dart';
import 'components/category_chips.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: Scaffold(
                  body: Column(
                children: [
                  Row(
                    children: [
                      // Once user click the menu icon the menu shows like drawer
                      // Also we want to hide this menu icon on desktop
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                    ],
                  ),
                  CategoryChips(),
                ],
              )),
            ),
            Expanded(
              flex: 9,
              child: EmailScreen(),
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
                Expanded(child: CategoryChips()),
                Expanded(
                    child: Placeholder(
                  color: Colors.green,
                )),
              ]),
              // child: ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 8,
              // child: EmailScreen(),
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
