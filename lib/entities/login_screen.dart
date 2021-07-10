import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnirio_app/entities/signup_screen.dart';
import 'package:omnirio_app/model/login_model.dart';
import 'package:omnirio_app/utils/my_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passTextController = new TextEditingController();
  TextEditingController usernameTextController = new TextEditingController();
  bool passVisible;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordInvisible = true;
  String usertext;
  String passtext;
  bool remember_check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  // height: 100,
                  // width: 100,
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.network(
                  "https://app.omnirio.com/assets/images/logo-full.png",
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 40.0, 36.0, 40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    labelText("Username or Email"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: usernameTextController,
                      textAlign: TextAlign.left,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          usertext = value;
                          usernameTextController.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: usertext.length));
                        });
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff6f7f9),
                        errorText: EmailValidator.validate(
                                    usernameTextController.text.toString()) ==
                                true
                            ? ""
                            : "Please enter the valid email",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        hintText: 'Enter Username or Email',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w200),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: const Color(0xffa8abc1), width: 1)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: const Color(0x80eb5b77),
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: const Color(0x80eb5b77),
                              width: 1,
                            )),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    labelText("Password"),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: const Color(0xfff6f7f9)),
                      child: TextFormField(
                        controller: passTextController,
                        obscureText: passwordInvisible,
                        autofocus: false,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          setState(() {
                            passtext = value;
                            passTextController.selection =
                                TextSelection.fromPosition(
                                    TextPosition(offset: passtext.length));
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 15.0),
                          hintText: 'Enter Password',
                          errorMaxLines: 2,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.w200),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: const Color(0xffa8abc1), width: 1)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordInvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordInvisible = !passwordInvisible;
                              });
                            },
                          ),
                          errorText: MyUtils().validatePassword(
                                      passTextController.text) ==
                                  true
                              ? ""
                              : "Please enter the 1 capital, 1 small and 1 special character",
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: const Color(0x80eb5b77),
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: const Color(0x80eb5b77),
                                width: 1,
                              )),
                        ),
                        autovalidate: true,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: remember_check,
                              checkColor: Colors.white, // color of tick Mark
                              activeColor: Colors.redAccent,
                              onChanged: (bool value) async {
                                // setState(() {

                                setState(() {
                                  remember_check = value;
                                  // remember_check != remember_check;
                                });
                                if (value == true) {
                                  String username;
                                  String pass;
                                  LoginModel logindata = new LoginModel();
                                  username = EmailValidator.validate(
                                              usernameTextController.text) ==
                                          true
                                      ? usernameTextController.text
                                          .toString()
                                          .trim()
                                      : null;
                                  pass = MyUtils().validatePassword(
                                              passTextController.text) ==
                                          true
                                      ? passTextController.text
                                          .toString()
                                          .trim()
                                      : null;

                                  if (username != null && pass != null) {
                                    logindata.usernameOrEmail = username;
                                    logindata.password = pass;
                                    String userData =
                                        logindata.toJson().toString();
                                    print(userData);
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString("user", userData);
                                    Toast.show(
                                        "your Data got saved for future login",
                                        context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: 1);
                                    usernameTextController.text = null;
                                    passTextController.text = null;
                                  }
                                }
                                // });
                              }),
                          Expanded(
                            child: Text(
                              "Remember me",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  onPressed: () async {
                                    String username;
                                    String pass;
                                    LoginModel logindata = new LoginModel();
                                    username = EmailValidator.validate(
                                                usernameTextController.text) ==
                                            true
                                        ? usernameTextController.text
                                            .toString()
                                            .trim()
                                        : null;
                                    pass = MyUtils().validatePassword(
                                                passTextController.text) ==
                                            true
                                        ? passTextController.text
                                            .toString()
                                            .trim()
                                        : null;

                                    if (username != null && pass != null) {
                                      Toast.show("you are logged in", context,
                                          duration: Toast.LENGTH_LONG,
                                          gravity: 1);
                                      logindata.usernameOrEmail = username;
                                      logindata.password = pass;
                                      String userData =
                                          logindata.toJson().toString();
                                      print(userData);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Login',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  color: Colors.lightBlue,
                                  // new CommonData().colorFromHex("#e95d5d"),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                        color: Colors.lightBlue,
                                        // new CommonData().colorFromHex("#e95d5d"),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
//                              ForgotPasswordPage
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           ForgotPasswordPage()));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          labelText("Don't have an account?"),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpScreen()));
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelText(String s) {
    return Container(
        child: Text(
      s,
      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),
    ));
  }
}
