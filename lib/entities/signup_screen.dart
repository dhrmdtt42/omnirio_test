import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:omnirio_app/utils/my_utils.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passTextController = new TextEditingController();
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController nameTextController = new TextEditingController();
  TextEditingController mobileTextController = new TextEditingController();
  bool referalCheck = false;
  bool terms_check = false;
  String name;
  String email;
  String pass;
  String mobile;

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
                    "Sign Up",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//    headerText("Login"),
                    SizedBox(height: 10.0),
                    labelText("Full Name*"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: nameTextController,
                      textAlign: TextAlign.left,
//                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          nameTextController.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: name.length));
                        });
                      },
//                      onFieldSubmitted: (value) {
//
//                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff6f7f9),
                        errorText: name.isEmpty == true
                            ? "Name should not be empty"
                            : null,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        hintText: 'Enter Full Name',
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
                    SizedBox(height: 10.0),
                    labelText("Email*"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: emailTextController,
                      textAlign: TextAlign.left,
//                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          emailTextController.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: email.length));
                        });
                      },
//                      onFieldSubmitted: (value) {
//
//                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff6f7f9),
                        errorText: EmailValidator.validate(
                                    emailTextController.text.toString()) ==
                                true
                            ? ""
                            : "Please enter the valid email",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        hintText: 'Enter Email',
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
                    labelText("Password*"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: passTextController,
                      textAlign: TextAlign.left,
//                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                          passTextController.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: pass.length));
                        });
                      },
//                      onFieldSubmitted: (value) {
//
//                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff6f7f9),
                        errorText: MyUtils().validatePassword(
                                    passTextController.text) ==
                                true
                            ? ""
                            : "Please enter the 1 capital, 1 small and 1 special character",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        hintText: 'Enter Password',
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
                    labelText("Mobile Number*"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: mobileTextController,
                      textAlign: TextAlign.left,
                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        // setState(() {
                        //   if (value != " ")
                        //     // isNum = isNumeric(value);
                        //   else
                        //     value = "";
                        // });
                      },
//                      onFieldSubmitted: (value) {
//
//                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff6f7f9),
                        errorText: mobile.isEmpty == true
                            ? "please enter the mobile number"
                            : null,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        hintText: 'Enter Mobile Number',
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
                        prefixIcon: CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IN',
                          favorite: ['+91', 'IN'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: const Color(0x80eb5b77),
                              width: 1,
                            )),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: referalCheck,
                              checkColor: Colors.white, // color of tick Mark
                              activeColor: Colors.redAccent,
                              onChanged: (bool value) async {
                                // setState(() {

                                setState(() {
                                  referalCheck = value;
                                  // remember_check != remember_check;
                                });

                                // });
                              }),
                          Expanded(
                            child: Text(
                              "Do you have any referal?",
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
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: terms_check,
                              checkColor: Colors.white, // color of tick Mark
                              activeColor: Colors.redAccent,
                              onChanged: (bool value) async {
                                // setState(() {

                                setState(() {
                                  terms_check = value;
                                });

                                // });
                              }),
                          Expanded(
                            child: Text(
                              "I agree with the terms & condition",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () async {
                              String username;
                              String pass;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'SignUp',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 16.0),
                              ),
                            ),
                            color: Colors.lightBlue,
                            // new CommonData().colorFromHex("#e95d5d"),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                  color: Colors.lightBlue,
                                  // new CommonData().colorFromHex("#e95d5d"),
                                )),
                          ),
                        ),
                        labelText(" Have an account?"),
                        SizedBox(width: 2.0),
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
                            "SignUp",
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
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
