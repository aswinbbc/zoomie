import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../models/provider_model/selection.dart';
import '../utils/constants.dart';

class TakeAway extends StatelessWidget {
  const TakeAway({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              // WebsafeSvg.asset("assets/Icons/Plus.svg", width: 16),
              // SizedBox(width: kDefaultPadding / 4),
              WebsafeSvg.asset("assets/Icons/bag.svg", width: 20),
              const SizedBox(width: kDefaultPadding / 2),
              Text(
                "Take Away",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: kGrayColor),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    Provider.of<Selection>(context, listen: false).setCarNo =
                        value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Car No:",
                    fillColor: kBgLightColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 1),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    Provider.of<Selection>(context, listen: false)
                        .setContactNo = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Contact No:",
                    fillColor: kBgLightColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 1),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    Provider.of<Selection>(context, listen: false)
                        .setContactName = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Contact Name:",
                    fillColor: kBgLightColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
