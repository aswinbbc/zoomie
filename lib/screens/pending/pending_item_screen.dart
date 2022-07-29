import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/provider_model/selection.dart';
import '../../utils/actions.dart';
import '../../models/pending_details.dart';
import '../cart/component/cart_item.dart';
import 'components/pending_item.dart';

class PendingItemScreen extends StatefulWidget {
  const PendingItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PendingItemScreen> createState() => _PendingItemScreenState();
}

class _PendingItemScreenState extends State<PendingItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Selection>(builder: (context, selection, _) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ordered',
                maxLines: 20,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              selection.kotEntryId != "not submitted"
                  ? FutureBuilder(
                      future: getPendingKOTMasterDetails(selection.kotEntryId),
                      builder: (context,
                          AsyncSnapshot<List<PendingItemModel>> snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                key: UniqueKey(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  PendingItemModel pendingItemModel =
                                      snapshot.data!.elementAt(index);
                                  return PendingItemCard(
                                      onCountChange: ((count) {}),
                                      onRemove: () {},
                                      count: double.parse(pendingItemModel.qty!)
                                          .round(),
                                      index: index,
                                      pendingItemModel: pendingItemModel);
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      })
                  : const Text("no data")
            ],
          ),
        ],
      );
    });
  }
}
