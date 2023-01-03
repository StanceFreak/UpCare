import 'package:email_validator/email_validator.dart';
import 'package:UpCare/views/BottomNav.dart';
import 'package:UpCare/views/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'RegisterUser.dart';

// void main() => runApp(LoginUser());

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);

    // return Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenLightColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: whiteColor,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Selamat datang',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Silahkan login terlebih dahulu',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  controller: emailController,
                  validator: (value) {
                    bool isEmailValid = EmailValidator.validate(value!);
                    if (value.isEmpty || value == null) {
                      return 'email tidak boleh kosong';
                    } else if (!isEmailValid) {
                      return 'Masukkan Email yang valid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Contoh : johnbagas@gmail.com',
                      hoverColor: whiteColor,
                      hintStyle: TextStyle(fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: darkBlueColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: darkBlueColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red)),
                      filled: true,
                      fillColor: whiteColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(fontSize: 14),
                  controller: passController,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Masukkan password anda',
                    hoverColor: whiteColor,
                    hintStyle: TextStyle(fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: darkBlueColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: darkBlueColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red)),
                    filled: true,
                    fillColor: whiteColor,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      'Lupa password?',
                      style: TextStyle(
                          color: darkBlueColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: Builder(
                      builder: (context) => TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final credential =
                                    await auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passController.text);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Berhasil login'),
                                  duration: Duration(seconds: 2),
                                ));
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/navigation',
                                    (Route<dynamic> route) => false);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Email dan Password tidak cocok!'),
                                    duration: Duration(seconds: 2),
                                  ));
                                } else if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('User tidak ditemukan!'),
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: greenLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.w600),
                          )),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
