import 'package:emr_mobile/views/LandingPage.dart';
import 'package:emr_mobile/views/RawatInapPage.dart';
import 'package:emr_mobile/views/RiwayatPendaftaranPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dbAuth = FirebaseAuth.instance;
  final dbReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  color: greenLightColor,
                ),
                Column(
                  children: [
                    SizedBox(height: 75),
                    Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/icons/male.png"),
                        radius: 50,
                      ),
                    ),
                  ],
                ),
              ]),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          // 'Nama User',
                          dbAuth.currentUser?.displayName ?? 'Username',
                          // snapshot.child('nama').value.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: darkBlueColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        // 'Email User',
                        dbAuth.currentUser?.email ?? 'user@gmail.com',
                        // snapshot.child('email').value.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: darkBlueColor, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RiwayatPendaftaranPage()));
                      },
                      child: Card(
                          elevation: 2.0,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '4',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: darkBlueColor),
                                      ),
                                      Text(
                                        'Menunggu \n konfirmasi',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14, color: darkBlueColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        '0',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: darkBlueColor),
                                      ),
                                      Text(
                                        'Telah \n Dikonfirmasi',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14, color: darkBlueColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        '0',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: darkBlueColor),
                                      ),
                                      Text(
                                        'Permintaan \n Ditolak',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14, color: darkBlueColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1.0,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  Icons.person_outline,
                                  color: greenLightColor,
                                ),
                                title: Text(
                                  'Akun anda',
                                  style: TextStyle(color: darkBlueColor),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: greenLightColor,
                            ),
                            SizedBox(width: 20)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1.0,
                        child: Row(children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(
                                Icons.help_outline_rounded,
                                color: greenLightColor,
                              ),
                              title: Text(
                                'Pusat Bantuan',
                                style: TextStyle(color: darkBlueColor),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: greenLightColor,
                          ),
                          SizedBox(width: 20)
                        ]),
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                content: Text(
                                  'Apa anda yakin ingin log out?',
                                  style: TextStyle(color: darkBlueColor),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LandingPage()));
                                      // Navigator.pushNamedAndRemoveUntil(context,
                                      //     '/', (Route<dynamic> route) => false);
                                    },
                                    child: Text(
                                      'Ya',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text(
                                      'Tidak',
                                      style: TextStyle(color: darkBlueColor),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1.0,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  Icons.logout_outlined,
                                  color: greenLightColor,
                                ),
                                title: Text(
                                  'Log Out',
                                  style: TextStyle(color: darkBlueColor),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: greenLightColor,
                            ),
                            SizedBox(width: 20)
                          ],
                        ),
                      ),
                    ),
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
