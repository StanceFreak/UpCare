import 'dart:developer';

import 'package:emr_mobile/services/FirebaseService.dart';
import 'package:emr_mobile/views/HomePage.dart';
import 'package:emr_mobile/views/LoginUser.dart';
import 'package:emr_mobile/views/RegisterUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final auth = FirebaseAuth.instance;
  bool _isGoogleSign = false;

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);
    const blueColor = Color(0xFF77ACF1);

    return StreamBuilder(
      builder: ((context, snapshot) {
        return Scaffold(
          backgroundColor: whiteGreyColor,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/landing_illus.png'),
                          fit: BoxFit.fill),
                      shape: BoxShape.rectangle),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Selamat Datang',
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 22),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Hidup sehat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Demi masa depan yang cemerlang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 25),
                    width: 325,
                    height: 50,
                    child: Builder(
                      builder: (context) => TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginUser()));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: greenLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          child: Text(
                            'Masuk menggunakan Email',
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.w600),
                          )),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'Atau',
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: 325,
                    height: 50,
                    child: Builder(
                      builder: (context) => TextButton(
                          onPressed: () async {
                            setState(() {
                              _isGoogleSign = true;
                            });
                            User? user = await FirebaseService.signInWithGoogle(
                                context: context);
                            setState(() {
                              _isGoogleSign = false;
                            });
                            log(user!.email.toString());
                            if (user != null) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/navigation',
                                  (Route<dynamic> route) => false);
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: greenLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                          child: Text(
                            'Masuk menggunakan Google',
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.w600),
                          )),
                    )),
                Builder(
                    builder: (context) => RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(text: 'Belum memiliki akun?'),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 3,
                              )),
                              TextSpan(
                                  text: 'Daftar sekarang',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterUser()));
                                    }),
                            ])))
              ],
            ),
          ),
        );
      }),
      // child: MaterialApp(
      // // return MaterialApp(
      //   theme: ThemeData(fontFamily: 'Epilogue'),
      //   debugShowCheckedModeBanner: false,
      //   home: Scaffold(
      //     backgroundColor: whiteGreyColor,
      //     body: Container(
      //       width: double.infinity,
      //       height: double.infinity,
      //       padding: EdgeInsets.all(30),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.max,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Container(
      //             margin: EdgeInsets.only(top: 20),
      //             width: 180,
      //             height: 180,
      //             decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: AssetImage('assets/images/landing_illus.png'),
      //                     fit: BoxFit.fill),
      //                 shape: BoxShape.rectangle),
      //           ),
      //           Align(
      //             alignment: Alignment.center,
      //             child: Container(
      //                 margin: EdgeInsets.only(top: 25),
      //                 child: Text(
      //                   'Selamat Datang',
      //                   style: TextStyle(
      //                       color: darkBlueColor,
      //                       fontWeight: FontWeight.w800,
      //                       fontSize: 22),
      //                 )),
      //           ),
      //           Align(
      //             alignment: Alignment.center,
      //             child: Container(
      //                 margin: EdgeInsets.only(top: 10),
      //                 child: Text(
      //                   'Hidup sehat',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: darkBlueColor,
      //                       fontWeight: FontWeight.w600,
      //                       fontSize: 18),
      //                 )),
      //           ),
      //           Align(
      //             alignment: Alignment.center,
      //             child: Container(
      //                 margin: EdgeInsets.only(top: 10),
      //                 child: Text(
      //                   'Demi masa depan yang cemerlang',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: darkBlueColor,
      //                       fontWeight: FontWeight.w600,
      //                       fontSize: 18),
      //                 )),
      //           ),
      //           Container(
      //               margin: EdgeInsets.only(top: 25),
      //               width: 325,
      //               height: 50,
      //               child: Builder(
      //                 builder: (context) => TextButton(
      //                     onPressed: () {
      //                       Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => const LoginUser()));
      //                     },
      //                     style: TextButton.styleFrom(
      //                       backgroundColor: greenLightColor,
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(7)),
      //                     ),
      //                     child: Text(
      //                       'Masuk menggunakan Email',
      //                       style: TextStyle(
      //                           fontSize: 16,
      //                           color: whiteColor,
      //                           fontWeight: FontWeight.w600),
      //                     )),
      //               )),
      //           Align(
      //               alignment: Alignment.center,
      //               child: Container(
      //                 margin: EdgeInsets.only(top: 5, bottom: 5),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   mainAxisSize: MainAxisSize.max,
      //                   children: [
      //                     Container(
      //                       margin: EdgeInsets.only(top: 5, bottom: 5),
      //                       child: Text(
      //                         'Atau',
      //                         style: TextStyle(
      //                             color: darkBlueColor,
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )),
      //           Container(
      //               margin: EdgeInsets.only(bottom: 15),
      //               width: 325,
      //               height: 50,
      //               child: Builder(
      //                 builder: (context) => TextButton(
      //                     onPressed: () {
      //                       Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => const LoginUser()));
      //                     },
      //                     style: TextButton.styleFrom(
      //                       backgroundColor: greenLightColor,
      //                       shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(7)),
      //                     ),
      //                     child: Text(
      //                       'Masuk menggunakan Google',
      //                       style: TextStyle(
      //                           fontSize: 16,
      //                           color: whiteColor,
      //                           fontWeight: FontWeight.w600),
      //                     )),
      //               )),
      //           Builder(
      //               builder: (context) => RichText(
      //                       text: TextSpan(
      //                           style: TextStyle(
      //                               color: darkBlueColor,
      //                               fontSize: 18,
      //                               fontWeight: FontWeight.w400),
      //                           children: [
      //                         TextSpan(text: 'Belum memiliki akun?'),
      //                         WidgetSpan(
      //                             child: SizedBox(
      //                           width: 3,
      //                         )),
      //                         TextSpan(
      //                             text: 'Daftar sekarang',
      //                             style: TextStyle(fontWeight: FontWeight.w600),
      //                             recognizer: TapGestureRecognizer()
      //                               ..onTap = () {
      //                                 Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                         builder: (context) =>
      //                                             RegisterUser()));
      //                               }),
      //                       ])))
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
