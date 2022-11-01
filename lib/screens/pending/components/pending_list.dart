import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/models/pending_item.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';

import '../../../models/provider_model/selection.dart';
import '../../../utils/actions.dart';

class PendingList extends StatelessWidget {
  const PendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPendingKOTMaster(),
        builder: (context, AsyncSnapshot<List<PendingItem>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              controller: ScrollController(),
              itemBuilder: (context, index) {
                PendingItem pendingItem = snapshot.data!.elementAt(index);
                final bool isDining = pendingItem.orderType == "Dining";
                return InkWell(
                  onTap: () async {
                    newOrder(context);
                    Provider.of<Selection>(context, listen: false).setType =
                        pendingItem.orderType!;
                    Provider.of<Selection>(context, listen: false).setCarNo =
                        pendingItem.carNo!;
                    Provider.of<Selection>(context, listen: false).setTable =
                        pendingItem.tableId!;
                    Provider.of<Selection>(context, listen: false)
                        .setTableName = pendingItem.tableName!;
                    Provider.of<Selection>(context, listen: false)
                        .setKOTEntryId = pendingItem.salesId!;
                    var value =
                        await getPendingKOTMasterDetails(pendingItem.salesId!);
                    Provider.of<ProductsListModel>(context, listen: false)
                        .addPendings(value);
                  },
                  child: isDining
                      ? Card(
                          color: Colors.red,
                          child: ListTile(
                            leading: const Icon(Icons.dining),
                            title: Text(pendingItem.tableId! +
                                "\nUser:" +
                                pendingItem.userName!),
                            subtitle: Text("KNo:" + pendingItem.billNo!),
                          ))
                      : Card(
                          child: ListTile(
                          leading: const Icon(Icons.car_repair),
                          title: Text(pendingItem.carNo! +
                              "\nUser:" +
                              pendingItem.userName!),
                          subtitle: Text("KNo:" + pendingItem.billNo!),
                        )),
                );
              },
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
  }
}
