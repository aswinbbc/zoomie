import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomie_kot/models/provider_model/id_model.dart';
import 'package:zoomie_kot/models/provider_model/product_list.dart';
import 'package:zoomie_kot/models/provider_model/selection.dart';
import 'package:zoomie_kot/screens/login/login.dart';
import 'package:zoomie_kot/utils/test_print.dart';

import 'screens/main/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IdModel()),
        ChangeNotifierProvider(create: (context) => ProductsListModel()),
        ChangeNotifierProvider(create: (context) => Selection()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: MainScreen(),
      // home: const TestPrint(),
    );
  }
}
