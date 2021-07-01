import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/provider/user_provider.dart';
import 'package:society/services/functions.dart';
import 'package:society/services/styles.dart';
import 'package:society/widgets/custom_text.dart';
import 'package:society/widgets/loading.dart';

import 'home.dart';
import 'login1.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      body: user.status == Status.Authenticating
          ? Loading()
          : Container(
              color: white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: CustomText(
                            msg: "Hey There!",
                            size: 36,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     CustomText(
                    //       msg: "Create your new account!",
                    //       size: 22,
                    //       weight: FontWeight.w600,
                    //       color: grey,
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: user.name,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                            hintText: 'Your name',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: user.email,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    // ConstrainedBox(
                    //     constraints: BoxConstraints(
                    //       minWidth: double.infinity,
                    //       maxHeight: 65.0,
                    //     ),
                    //     child: Container(
                    //       child: Column(
                    //         children: [
                    //           DropDownField(
                    //               controller: user.jimbo,
                    //               hintText: "Chagua Jimbo lako",
                    //               enabled: true,
                    //               itemsVisibleInDropdown: 5,
                    //               items: jimbo,
                    //               onValueChanged: (value) {
                    //                 setState(() {
                    //                   selectJimbo = value;
                    //                 });
                    //               })
                    //         ],
                    //       ),
                    //     )),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: user.jimbo,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                            hintText: 'Chagua Jimbo lako',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: <Widget>[
                          TextField(
                            obscureText: true,
                            controller: user.password,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                hintText: 'Password',
                                hintStyle: TextStyle(fontSize: 20)),
                          ),
                          // Positioned(
                          //     top: 13,
                          //     right: 20,
                          //     child: CustomText(
                          //       msg: "Forgot?",
                          //       color: blue,
                          //     )
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(color: green),
                        child: GestureDetector(
                          onTap: () async {
                            if (!await user.signUp()) {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("Sign up failed")));
                              return;
                            }
                            user.clearController();
                            changeScreenReplacement(context, HomeScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: CustomText(
                                  msg: "REGISTER",
                                  color: white,
                                  size: 24,
                                  weight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              changeScreen(context, LoginOne());
                            },
                            child: CustomText(
                              msg:
                                  "if you have an account click here to login!",
                              size: 15,
                              weight: FontWeight.bold,
                              color: black,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

String selectJimbo = "";
List<String> jimbo = [
  "Kinondoni",
  "Ilala",
  "Segerea",
  "Ukonga",
  "Kawe",
  "Kibamba",
  "Ubungo",
  "Kigamboni",
  "Temeke",
  "Mbagala"
];
