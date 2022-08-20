import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer.dart';
import 'package:zoomie_kot/models/kitchen.dart';
import 'package:zoomie_kot/utils/actions.dart';
import 'package:zoomie_kot/utils/constant.dart';
import 'package:zoomie_kot/widget/custom_alert.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PrinterSettings extends StatefulWidget {
  const PrinterSettings({Key? key}) : super(key: key);

  @override
  State<PrinterSettings> createState() => _PrinterSettingsState();
}

class _PrinterSettingsState extends State<PrinterSettings> {
  final controller = TextEditingController();
  final ipController = TextEditingController();

  var isNetwork = true;

  String bluetoothname = "";

  @override
  initState() {
    super.initState();
    Constants.ip.then((value) => setState((() => ipController.text = value)));
    getSharedPrefString("printer_type").then((value) {
      setState(() {
        isNetwork = value != "bluetooth";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                  child: TextField(
                decoration:
                    const InputDecoration(hintText: "Enter server IP here"),
                controller: ipController,
              )),
              ElevatedButton(
                  onPressed: () {
                    Constants().setIp(ipController.text).then(
                        (value) => showMessage("ip saved, please restart"));
                  },
                  child: const Text('Save')),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Please select printer type : "),
                FlutterSwitch(
                  width: 250.0,
                  activeText: "Network",
                  inactiveText: "Bluetooth",
                  height: 55.0,
                  valueFontSize: 25.0,
                  toggleSize: 45.0,
                  value: isNetwork,
                  borderRadius: 30.0,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (val) {
                    isNetwork = val;
                    setState(() {
                      setSharedPrefString(
                              "printer_type", val ? "network" : "bluetooth")
                          .then((value) => showMessage("saved"));
                    });
                  },
                ),
              ],
            ),
          ),
          isNetwork
              ? FutureBuilder(
                  future: getAllKitchens(),
                  builder: (context, AsyncSnapshot<List<Kitchen>> snapshot) =>
                      snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final kitchen = snapshot.data!.elementAt(index);

                                return Card(
                                    child: InkWell(
                                  onTap: () async {
                                    final ip = await getSharedPrefString(
                                        kitchen.pknId!);
                                    controller.text = ip;
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomAlert(
                                          widget: Column(
                                            children: [
                                              Text('kitchen name : ' +
                                                  kitchen.pknName!),
                                              TextField(controller: controller),
                                            ],
                                          ),
                                          title: "New IP address",
                                          okClick: () async {
                                            bool isSaved =
                                                await setSharedPrefString(
                                                    kitchen.pknId!,
                                                    controller.text);

                                            isSaved
                                                ? showMessage("IP saved")
                                                : null;
                                          }),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(kitchen.pknName!),
                                    subtitle: Text(
                                        'printer : ${kitchen.printerName}'),
                                  ),
                                ));
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                )
              : Row(
                  children: [
                    Text(bluetoothname),
                    ElevatedButton(
                        onPressed: () {
                          FlutterBluetoothPrinter.selectDevice(context)
                              .then((value) {
                            setState(() {
                              bluetoothname = value != null
                                  ? value.address
                                  : "no device found";
                              if (value != null) {
                                setSharedPrefString(
                                        "bluetooth_name", bluetoothname)
                                    .then((value) =>
                                        showMessage("bluetooth name saved"));
                              }
                            });
                          });
                        },
                        child: const Text("select bluetooth printer")),
                  ],
                ),
        ],
      )),
    );
  }
}
