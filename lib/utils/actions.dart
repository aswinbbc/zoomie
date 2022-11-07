import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomie_kot/models/kitchen.dart';
import 'package:zoomie_kot/models/modifier_model.dart';
import 'package:zoomie_kot/models/pending_details.dart';
import 'package:zoomie_kot/models/pending_item.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/utils/network_service.dart';
import 'package:intl/intl.dart';

import '../models/provider_model/product_list.dart';
// import 'package:fluttertoast/fluttertoast.dart';
/** call....**
                                        writeKOTMaster(
                                          selection.type,
                                          selection.carNo,
                                          selection.contactNo,
                                          selection.contactName,
                                          await Constants.userId,
                                          productList.total.toString(),
                                          selection.table)
**/ 
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
      "KOT/WriteKOTMaster?entryDate=$formattedDate&systemId=1&customerId=60&salesmanId=$salesMan&kotTotalAmount=$totalAmount&userId=$salesMan&tableId=$table&orderType=$type",
      post: false);
  // print(result);
  return result.first['BillID'].toString();
}

writeKOTMasterDetails(String kotEntryId, String serialNo, String productId,
    String quantity, String price, String rowId, String narration) async {
  final List result = await getData(
      "KOT/WriteKOTDetails?kotEntryId=$kotEntryId&serialNo=$serialNo&productId=$productId&uom=PCS&qty=$quantity&price=$price&narration=$narration&details_row_id=$rowId",
      post: false);
  print(result);
  return result.first.toString();
}

newOrder(BuildContext context) {
  Provider.of<ProductsListModel>(context, listen: false).init();
  Provider.of<Selection>(context, listen: false).init();
  Provider.of<IdModel>(context, listen: false).init();
}

Future<List<PendingItem>> getPendingKOTMaster() async {
  final List result =
      await getData("KOT/GetPendingKOTMaster?branch_id=1", post: false);

  return result.map((json) => PendingItem.fromJson(json)).toList();
}

Future<List<Kitchen>> getAllKitchens() async {
  final List result = await getData("Kitchen", post: false);
  // print(result.length);
  return result.map((json) => Kitchen.fromJson(json)).toList();
}

Future<List<ModifierModel>> getModifier(String productId) async {
  final List result = await getData(
      "Modifier/GetModifierByProdId?productId=$productId",
      post: false);
  // print(result.length);
  return result.map((json) => ModifierModel.fromJson(json)).toList();
}

Future<List<PendingItemModel>> getPendingKOTMasterDetails(
    String kotMasterId) async {
  final List result = await getData(
      "KOT/GetPendingKOTDetails?branch_id=1&kot_master_id=$kotMasterId",
      post: false);

  return result.map((json) => PendingItemModel.fromJson(json)).toList();
}

Future<String> getSharedPrefString(String key) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "no data saved";
}

Future<bool> setSharedPrefString(String key, String value) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}

showMessage(String msg) {
  var cancel = BotToast.showText(text: msg);
  // Fluttertoast.showToast(
  //     msg: msg,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
}
