import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:zoomie_kot/screens/main/main_screen.dart';
import 'package:zoomie_kot/screens/settings/printers.dart';
import 'package:zoomie_kot/utils/actions.dart';
import 'package:zoomie_kot/utils/constant.dart';
import 'package:zoomie_kot/utils/network_service.dart';

import '/widget/form_button.dart';
import '/widget/input_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({Key? key}) : super(key: key);
  @override
  _SimpleLoginScreenState createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  late String email, password;
  String? emailError, passwordError;
  BuildContext? myContext;

  var checker = false;

  @override
  void initState() {
    super.initState();

    Constants.userId.then((value) {
      // Route route = MaterialPageRoute(builder: (context) => Dashboard());
      // Navigator.pushReplacement(myContext!, route);
    });
    email = "";
    password = "";

    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty) {
      setState(() {
        emailError = "Username is invalid";
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Please enter a password";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      login(email, password, context);
    }
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://www.amalgamatetechnologies.com/"));
            },
            child: AutoSizeText(
              'AMALGAMATE TECHNOLOGIES',
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.black),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Innovation at its',
                ),
                TextSpan(
                  text: ' peak',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // TextSpan(
                //   text: ' lighting solution',
                // ),
              ],
            ),
            style: TextStyle(fontSize: 10),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/zoomie.png',
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 1),
              _buildBody(),
              FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrinterSettings(),
                        ));
                  },
                  child: const Icon(Icons.settings)),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                SizedBox(height: screenHeight * .05),
                Image.asset(
                  'assets/images/bot.gif',
                  height: 150,
                ),
                ...loginPage(screenHeight),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      'https://c.tenor.com/hE0T8D0GpXsAAAAC/joinblink-blink.gif',
                      height: 220,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: loginPage(screenHeight),
                ))
              ],
            );
          }
        }),
      ),
    );
  }

  List<Widget> loginPage(screenHeight) {
    return [
      SizedBox(height: screenHeight * .05),
      Visibility(
        child: Center(child: CircularProgressIndicator()),
        visible: checker,
      ),
      InputField(
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        labelText: "Username",
        errorText: emailError,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autoFocus: true,
      ),
      SizedBox(height: screenHeight * .025),
      InputField(
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        onSubmitted: (val) => submit(),
        labelText: "Password",
        errorText: passwordError,
        obscureText: true,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(
        height: screenHeight * .075,
      ),
      FormButton(
        text: "Log In",
        onPressed: submit,
      ),
      SizedBox(
        height: screenHeight * .015,
      ),
    ];
  }

  login(String? email, String? password, context) {
    getData(
      "AppUser/CheckUserExist",
      params: {
        "UserName": email,
        "Password": password,
      },
    ).then((value) async {
      try {
        if (value.first.containsKey('Status'))
          showMessage(value.first['Status']);
        // print(value.first);
        if (value.first.containsKey('UserID')) {
          // Obtain shared preferences.

          await Constants().setUserId(value.first['UserID']);
          await Constants().setUserName(value.first['UserName']);
          showMessage("welcome.");

          Route route =
              MaterialPageRoute(builder: (context) => const MainScreen());
          Navigator.pushReplacement(myContext!, route);
        } else {
          showMessage("username or password incorrect.");
        }
      } catch (e) {
        showMessage("username or password incorrect.");
      }
    });
  }
}
