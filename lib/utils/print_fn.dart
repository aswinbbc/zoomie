import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/utils/constant.dart';

void testReceipt(NetworkPrinter printer, List<CartItem> productsList,
    Selection selection, String name) {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String ctime = DateFormat("hh:mm:ss a").format(DateTime.now());
  printer.text('KOT PRINT: ${selection.type}',
      styles: const PosStyles(
          bold: true,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          align: PosAlign.center));
  printer.row([
    PosColumn(
      text: 'product',
      width: 9,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
    PosColumn(
      text: 'Qty',
      width: 3,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.right,
        underline: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
  ]);

  for (CartItem cartItem in productsList) {
    if (cartItem.rowId == "0")
      printer.row([
        PosColumn(
          text: cartItem.product.prodName! + ' ' + cartItem.product.narration,
          width: 10,
          styles: PosStyles(
            align: PosAlign.left,
            underline: true,
            width: cartItem.product.prodName!.length > 19
                ? PosTextSize.size1
                : PosTextSize.size2,
          ),
        ),
        PosColumn(
          text: cartItem.quantity.toString(),
          width: 2,
          styles: const PosStyles(
            align: PosAlign.right,
            underline: true,
            width: PosTextSize.size2,
          ),
        ),
      ]);
  }

  printer.row([
    PosColumn(
      text: 'user:',
      width: 4,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
    PosColumn(
      text: name,
      width: 8,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.left,
        underline: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
  ]);
  printer.row([
    PosColumn(
      text: 'table:',
      width: 4,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
    PosColumn(
      text: selection.tableName,
      width: 8,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.left,
        underline: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
  ]);
  printer.row([
    PosColumn(
      text: 'date time:',
      width: 3,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        bold: true,
      ),
    ),
    PosColumn(
      text: '$cdate $ctime',
      width: 9,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.left,
        underline: true,
      ),
    ),
  ]);

  printer.row([
    PosColumn(
      text: 'KOT NO:',
      width: 3,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        bold: true,
      ),
    ),
    PosColumn(
      text: selection.kotEntryId.toString(),
      width: 9,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.left,
        underline: true,
      ),
    ),
  ]);

  printer.feed(2);
  printer.cut();
}

void testp(NetworkPrinter printer) {
  // printer.text(
  //     'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
  // printer.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
  //     styles: PosStyles(codeTable: 'CP1252'));
  // printer.text('Special 2: blåbærgrød',
  //     styles: PosStyles(codeTable: 'CP1252'));

  // printer.text('Bold text', styles: PosStyles(bold: true));
  // printer.text('Reverse text', styles: PosStyles(reverse: true));
  // printer.text('Underlined text',
  //     styles: PosStyles(underline: true), linesAfter: 1);
  // printer.text('Align left', styles: PosStyles(align: PosAlign.left));
  // printer.text('Align center', styles: PosStyles(align: PosAlign.center));
  // printer.text('Align right',
  //     styles: PosStyles(align: PosAlign.right), linesAfter: 1);
  // printer.row([
  //   PosColumn(text: 'product'),
  //   PosColumn(text: 'quantity'),
  // ]);
  // printer.row([
  //   PosColumn(
  //     text: 'col3',
  //     width: 3,
  //     styles: PosStyles(align: PosAlign.center, underline: true),
  //   ),
  //   PosColumn(
  //     text: 'col6',
  //     width: 6,
  //     styles: PosStyles(align: PosAlign.center, underline: true),
  //   ),
  //   PosColumn(
  //     text: 'col3',
  //     width: 3,
  //     styles: PosStyles(align: PosAlign.center, underline: true),
  //   ),
  // ]);
  printer.text('KOT PRINT',
      styles: const PosStyles(
          bold: true,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          align: PosAlign.center));
  printer.row([
    PosColumn(
      text: 'product',
      width: 9,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
    PosColumn(
      text: 'Quantity',
      width: 3,
      styles: const PosStyles(
        align: PosAlign.left,
        underline: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    ),
  ]);

  printer.feed(2);
  printer.cut();
}

printNetwork(List<CartItem> productList, selection, String printerIp) async {
  const PaperSize paper = PaperSize.mm80;
  final profile = await CapabilityProfile.load();
  final String name = await Constants.userName;
  final printer = NetworkPrinter(paper, profile);

  final PosPrintResult res = await printer.connect(printerIp, port: 9100);

  if (res == PosPrintResult.success) {
    testReceipt(printer, productList, selection, name);

    printer.disconnect();
  }

  print('Print result: ${res.msg}');
  return 0;
}
