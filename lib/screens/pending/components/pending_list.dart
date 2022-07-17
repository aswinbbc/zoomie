import 'package:flutter/material.dart';
import 'package:zoomie_kot/components/actions.dart';
import 'package:zoomie_kot/models/pending_item.dart';

class PendingList extends StatelessWidget {
  const PendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPendingKOTMaster(),
        builder: (context, AsyncSnapshot<List<PendingItem>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemBuilder: (context, index) {
                PendingItem pendingItem = snapshot.data!.elementAt(index);
                final bool isDining = pendingItem.orderType == "Dining";
                return isDining
                    ? Card(color: Colors.red, child: ListTile())
                    : Card(child: ListTile());
              },
            );
          } else {
            return LinearProgressIndicator();
          }
        });
  }
}
