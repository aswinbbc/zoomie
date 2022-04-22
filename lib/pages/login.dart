import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomie_kot/utils/constant.dart';

import '../utils/network_service.dart';

import '/widget/form_button.dart';
import '/widget/input_field.dart';
import 'dashboard.dart';

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
      Route route = MaterialPageRoute(builder: (context) => Dashboard());
      Navigator.pushReplacement(myContext!, route);
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
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = "Email is invalid";
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

  @override
  Widget build(BuildContext context) {
    myContext = context;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .05),
            Image.network(
              'https://c.tenor.com/hE0T8D0GpXsAAAAC/joinblink-blink.gif',
              height: 220,
            ),
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
              labelText: "Email",
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
          ],
        ),
      ),
    );
  }

  login(String? email, String? password, context) {
    getData("login.php", params: {
      "email": email,
      "password": password,
    }).then((value) async {
      if (value['status'] as bool) {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', value['0']['s_register_id']);
        Fluttertoast.showToast(msg: "welcome.");
        if (value['0']['role'] == '2') {
          // Route route =
          //     MaterialPageRoute(builder: (context) => CustomerDashboard());
          // Navigator.pushReplacement(myContext!, route);
        } else {
          // Route route =
          //     MaterialPageRoute(builder: (context) => ShopDashboard());
          // Navigator.pushReplacement(myContext!, route);
        }
      } else {
        Fluttertoast.showToast(msg: "username or password incorrect.");
      }
    });
  }
}
