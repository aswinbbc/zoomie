import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:zoomie_kot/extensions.dart';

import '../utils/constants.dart';

class Tables extends StatelessWidget {
  const Tables({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
            // SizedBox(width: kDefaultPadding / 4),
            WebsafeSvg.asset("assets/Icons/table.svg", width: 20),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "Tables",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        buildTable(context, isSelected: true, title: "table 1"),
        buildTable(context, title: "table 2"),
        buildTable(context, title: "table 3"),
        buildTable(context, title: "table 4"),
      ],
    );
  }

  InkWell buildTable(BuildContext context,
      {bool isSelected = false, required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? Colors.blue : Colors.black,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
              leading: WebsafeSvg.asset(
                "assets/Icons/tb.svg",
                height: 30,
                color: isSelected ? Colors.blue : null,
              ),
              title: Text(title)),
        ).addNeumorphism(),
      ),
    );
  }
}
