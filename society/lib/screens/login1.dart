import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/provider/user_provider.dart';
import 'package:society/screens/register.dart';
import 'package:society/services/functions.dart';
import 'package:society/services/styles.dart';
import 'package:society/widgets/custom_text.dart';
import 'package:society/widgets/loading.dart';

class LoginOne extends StatefulWidget {
  @override
  _LoginOneState createState() => _LoginOneState();
}

class _LoginOneState extends State<LoginOne> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        key: _key,
        body: user.status == Status.Authenticating
            ? Loading()
            : Container(
                color: white,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 45),
                              child: CustomText(
                                msg: "Welcome back!",
                                size: 30,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     CustomText(
                        //       msg: "Please login to your account!",
                        //       size: 22,
                        //       weight: FontWeight.w600,
                        //       color: grey,
                        //     ),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(20),
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
                        Padding(
                          padding: const EdgeInsets.all(20),
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
                              //     ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(color: green),
                            child: GestureDetector(
                              onTap: () async {
                                if (!await user.signIn())
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Sign in failed")));
                                user.clearController();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15),
                                    child: CustomText(
                                      msg: "LOGIN",
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
                                  changeScreen(context, RegisterScreen());
                                },
                                child: CustomText(
                                  msg: "REGISTER NOW",
                                  size: 20,
                                  weight: FontWeight.bold,
                                  color: grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
