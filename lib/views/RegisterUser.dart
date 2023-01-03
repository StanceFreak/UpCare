import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:emr_mobile/model/FirebaseUser.dart';
import 'package:emr_mobile/views/LoginUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool isChecked = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  final dbReference = FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);

    return Scaffold(
      // backgroundColor: greenLightColor,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Buat akun baru',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 23),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 7,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nama Lengkap',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Contoh : John Bagas',
                          hoverColor: darkBlueColor,
                          hintStyle: TextStyle(color: darkBlueColor),
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'No. Handphone',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null) {
                          return 'No. HP tidak boleh kosong';
                        } else if (value.length < 12) {
                          return 'No. HP harus terdiri dari 12 angka';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: 'Contoh : 08xxxxxxxxxx',
                          hoverColor: darkBlueColor,
                          hintStyle: TextStyle(color: darkBlueColor),
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        bool isEmailValid = EmailValidator.validate(value!);
                        if (value == null) {
                          return 'Email tidak boleh kosong';
                        } else if (!isEmailValid) {
                          return 'Masukkan Email yang valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Contoh : johnbagas@gmail.com',
                          hoverColor: whiteColor,
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                        controller: passController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: 14),
                        validator: (value) {
                          if (value == null) {
                            return 'Password tidak boleh kosong';
                          } else if (value.length < 8) {
                            return 'Password tidak boleh kurang dari 8 karakter';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Masukkan password anda',
                            hoverColor: darkBlueColor,
                            hintStyle: TextStyle(color: darkBlueColor),
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
                            fillColor: whiteColor)),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 7,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Konfirmasi Password',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                        controller: confPassController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Konfirmasi password anda terlebih dahulu';
                          } else if (confPassController.text !=
                              passController.text) {
                            return 'Password tidak sama';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                            hintText: 'Masukkan kembali password anda',
                            hoverColor: darkBlueColor,
                            hintStyle: TextStyle(color: darkBlueColor),
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
                            fillColor: whiteColor)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Checkbox(
                              value: isChecked,
                              checkColor: whiteColor,
                              activeColor: darkBlueColor,
                              side: BorderSide(color: darkBlueColor, width: 2),
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              'I agree with the Terms and Conditions',
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 50,
                        child: Builder(
                          builder: (context) => TextButton(
                              onPressed: () async {
                                if (!isChecked) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Centangi kolom persetujuan terlebih dahulu!'),
                                    duration: Duration(seconds: 2),
                                  ));
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    // if (emailController.text.isNotEmpty) {
                                    try {
                                      final credential = await auth
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passController.text);
                                      dbReference
                                          .child(auth.currentUser!.uid)
                                          .set({
                                        'nama': nameController.text,
                                        'email': emailController.text,
                                        'no_hp': phoneController.text,
                                        'password': passController.text,
                                        'login_type': 'email_and_password'
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Berhasil membuat akun'),
                                        duration: Duration(seconds: 2),
                                      ));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginUser()));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'email-already-in-use') {
                                        print(e.toString());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('Email sudah terdaftar'),
                                          duration: Duration(seconds: 2),
                                        ));
                                      }
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
                                'Register',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600),
                              )),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
