import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:zoomie_kot/extensions.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/models/table.dart' as kot;
import 'package:zoomie_kot/models/all_lists.dart';
import '../utils/constants.dart';

class Tables extends StatefulWidget {
  Tables({
    Key? key,
  }) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  int selectedId = 0;

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
        FutureBuilder(
          future: getTables(),
          builder: (context, AsyncSnapshot<List<kot.Table>> snapshot) {
            if (snapshot.hasData) {
              List<kot.Table> tables = snapshot.data!;
              final tableWids = tables
                  .map((e) => buildTable(context,
                      title: "table ${e.tableName}",
                      tableNo: e.tableId.toString(),
                      position: tables.indexOf(e)))
                  .toList();
              return Wrap(direction: Axis.horizontal, children: [...tableWids]);
            } else if (snapshot.hasError) {
              return const Center(child: Text("error!"));
            } else {
              return const Center(child: Text("loading!"));
            }
          },
        ),
      ],
    );
  }

  Container buildTable(BuildContext context,
      {required String title, required int position, required String tableNo}) {
    return Container(
      child: Consumer<Selection>(builder: (context, selection, _) {
        return InkWell(
          onTap: () {
            Provider.of<Selection>(context, listen: false).setTable = tableNo;
            setState(() {
              selectedId = position;
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: selectedId == position ? Colors.blue : Colors.black,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                  leading: WebsafeSvg.asset(
                    "assets/Icons/tb.svg",
                    height: 30,
                    color: selectedId == position ? Colors.blue : null,
                  ),
                  title: Text(title)),
            ).addNeumorphism(),
          ),
        );
      }),
    );
  }
}
