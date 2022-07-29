import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:zoomie_kot/screens/pending/components/pending_list.dart';

import '../../utils/constants.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
            // SizedBox(width: kDefaultPadding / 4),
            WebsafeSvg.asset("assets/Icons/File.svg", width: 20),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "Pending",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        PendingList(),
      ],
    );
  }
}
