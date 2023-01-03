import 'package:UpCare/model/FirebaseUser.dart';
import 'package:UpCare/success_icon_icons.dart';
import 'package:UpCare/views/BottomNav.dart';
import 'package:UpCare/views/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PendaftaranSuksesPage extends StatefulWidget {
  PendaftaranSuksesPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/pendaftaranSukses';
  @override
  State<PendaftaranSuksesPage> createState() => _PendaftaranSuksesPageState();
}

class _PendaftaranSuksesPageState extends State<PendaftaranSuksesPage> {
  final dbAuth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);
    const blueColor = Color(0xFF77ACF1);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var idPasien = args['id_pasien'];
    var namaPasien = args['nama_pasien'];
    var tipeLayanan = args['tipe_layanan'];
    var tglKunjungan = args['tanggal_kunjungan'];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: greenLightColor,
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/navigation', (Route<dynamic> route) => false))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Pendaftaran Sukses',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: darkBlueColor),
                ),
              ),
            ),
            Center(
              child: Icon(
                SuccessIcon.check_circled,
                color: greenLightColor,
                size: 90,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Pasien ' + tipeLayanan + ' telah berhasil didaftarkan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: darkBlueColor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 15),
              child: Text(
                'Notifikasi akan dikirimkan saat verifikasi selesai',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: darkBlueColor),
              ),
            ),
            Card(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ID Pasien',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                          Spacer(),
                          Text(
                            idPasien,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Nama Pasien',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                          Spacer(),
                          Text(
                            namaPasien,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Tipe Layanan',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                          Spacer(),
                          Text(
                            tipeLayanan,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Tanggal Kunjungan',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                          Spacer(),
                          Text(
                            tglKunjungan,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: darkBlueColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 50,
                child: Builder(
                  builder: (context) => TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            '/navigation', (Route<dynamic> route) => false);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: greenLightColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        'Kembali ke halaman utama',
                        style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.w600),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
