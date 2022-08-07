import 'dart:convert';

import 'package:zoomie_kot/models/pending_item.dart';
import 'package:zoomie_kot/utils/network_service.dart';
import 'package:intl/intl.dart';

Future<String> writeKOTMaster(
    String type,
    String carNo,
    String contactNo,
    String contactName,
    String salesMan,
    String totalAmount,
    String table) async {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);

  final result = await getData(
      "KOT/WriteKOTMaster?entryDate=$formattedDate&systemId=1&customerId=1&salesmanId=$salesMan&kotTotalAmount=$totalAmount&userId=$salesMan&tableId=$table&orderType=$type",
      post: false);
  // print(result);
  return result.first['BillID'].toString();
}

writeKOTMasterDetails(
  String kotEntryId,
  String serialNo,
  String productId,
  String quantity,
  String price,
  String rowId,
) async {
  final result = await getData(
      "KOT/WriteKOTDetails?kotEntryId=$kotEntryId&serialNo=$serialNo&productId=$productId&uom=PCS&qty=$quantity&price=$price&narration=test&details_row_id=$rowId",
      post: false);
  // print(result);
  return result.toString();
}

Future<List<PendingItem>> getPendingKOTMaster() async {
  final List result =
      await getData("KOT/GetPendingKOTMaster?branch_id=1", post: false);

  return result.map((json) => PendingItem.fromJson(json)).toList();
}
