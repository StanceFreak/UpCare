import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:emr_mobile/model/Poli.dart';
import 'package:emr_mobile/views/PendaftaranSuksesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RawatInapPage extends StatefulWidget {
  const RawatInapPage({Key? key}) : super(key: key);

  @override
  State<RawatInapPage> createState() => _RawatInapPageState();
}

class _RawatInapPageState extends State<RawatInapPage> {
  final dbRefence = FirebaseDatabase.instance.ref();
  final dbAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final dbReference = FirebaseDatabase.instance.ref();
  final dbStorage = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final imagePicker = ImagePicker();
  TextEditingController kkController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String appTitle = 'Rawat Inap';
  DateTime? selectedDate;
  Poli? selectedValue;
  List<Poli> listPoli = <Poli>[
    Poli('0', 'Poli Paru'),
    Poli('1', 'Poli Paru 1'),
    Poli('2', 'Poli Paru 2'),
    Poli('3', 'Poli Penyakit Dalam 1'),
    Poli('4', 'Poli Penyakit Dalam 2'),
    Poli('5', 'Poli Anak'),
    Poli('6', 'Poli Asma'),
    Poli('7', 'Poli Bedah'),
    Poli('8', 'Poli Gigi'),
    Poli('9', 'Poli Kebidanan'),
    Poli('10', 'Poli Kulit dan Kelamin'),
  ];

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);

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
        title: Text(
          'Rawat Inap',
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Pendaftaran Rawat Inap',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 7,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'No. KK',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: kkController,
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null) {
                          return 'No. KK tidak boleh kosong';
                        } else if (value.length < 16) {
                          return 'No. KK harus terdiri dari 16 angka';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: 'Contoh : 34040xxxxxxxxxxx',
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
                          'Tempat Lahir',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: birthPlaceController,
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null) {
                          return 'Tempat lahir tidak boleh kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Contoh : Jakarta',
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
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 10,
                    //     bottom: 7,
                    //   ),
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       'Pilih Klinik',
                    //       style: TextStyle(
                    //           color: darkBlueColor,
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 16),
                    //     ),
                    //   ),
                    // ),
                    // DropdownButtonFormField(
                    //   hint: Text('Pilih Klinik'),
                    //   value: selectedValue,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Pilih klinik terlebih dahulu';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //       hoverColor: whiteColor,
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: BorderSide(color: darkBlueColor)),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: BorderSide(color: darkBlueColor)),
                    //       errorBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: BorderSide(color: Colors.red)),
                    //       focusedErrorBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8),
                    //           borderSide: BorderSide(color: Colors.red)),
                    //       filled: true,
                    //       fillColor: whiteColor),
                    //   items:
                    //       listPoli.map<DropdownMenuItem<Poli>>((Poli item) {
                    //     return DropdownMenuItem(
                    //         value: item, child: Text(item.name));
                    //   }).toList(),
                    //   onChanged: (Poli? newValue) {
                    //     setState(() {
                    //       selectedValue = newValue!;
                    //     });
                    //   },
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 10,
                    //     bottom: 7,
                    //   ),
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       'Surat Rujukan dari Rumah Sakit/Klinik',
                    //       style: TextStyle(
                    //           color: darkBlueColor,
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 16),
                    //     ),
                    //   ),
                    // ),
                    // TextFormField(
                    //     controller: imageController,
                    //     validator: (value) {
                    //       if (value!.isEmpty || value == null) {
                    //         return 'Upload surat rujukan terlebih dahulu';
                    //       }
                    //       return null;
                    //     },
                    //     style: TextStyle(fontSize: 14),
                    //     showCursor: false,
                    //     readOnly: true,
                    //     decoration: InputDecoration(
                    //         hintText: 'Upload surat rujukan',
                    //         hoverColor: darkBlueColor,
                    //         hintStyle: TextStyle(color: darkBlueColor),
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide:
                    //                 BorderSide(color: darkBlueColor)),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide:
                    //                 BorderSide(color: darkBlueColor)),
                    //         errorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(color: Colors.red)),
                    //         focusedErrorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(color: Colors.red)),
                    //         filled: true,
                    //         fillColor: whiteColor),
                    //     onTap: () async {
                    //       final selectedImage = await imagePicker
                    //           .pickImage(source: ImageSource.gallery);
                    //       setState(() {
                    //         imageFile = File(0, selectedImage!.path);
                    //       });
                    //     }),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 7,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Penyakit yang diderita',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: diseaseController,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Pasien harus memberitahukan mengenai penyakit yang di deritanya!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Contoh : Demam Berdarah',
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
                          'Pilih Tanggal Kunjungan',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    TextFormField(
                        controller: dateController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return 'Pilih tanggal kunjungan terlebih dahulu';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 14),
                        showCursor: false,
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: 'Pilih tanggal kunjungan',
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
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), // Refer step 1
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          if (picked != null && picked != selectedDate) {
                            setState(() {
                              selectedDate = picked;
                              dateController.text =
                                  DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                          ;
                        }),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: 50,
                        child: Builder(
                          builder: (context) => TextButton(
                              onPressed: () async {
                                final rawatInapId = UniqueKey().hashCode;
                                final pasienId = 'RI' + phoneController.text;
                                if (_formKey.currentState!.validate()) {
                                  await dbReference
                                      .child(auth.currentUser!.uid)
                                      .child('data_pasien')
                                      .child('rawat_inap')
                                      .child(rawatInapId.toString())
                                      .set({
                                    'no_kk': kkController.text,
                                    'nama': nameController.text,
                                    'no_hp': phoneController.text,
                                    'tempat_lahir': birthPlaceController.text,
                                    'penyakit': diseaseController.text,
                                    'tanggal_kunjungan': dateController.text
                                  });
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text(
                                  //       'Berhasil mendaftarkan rawat inap'),
                                  //   duration: Duration(seconds: 2),
                                  // ));
                                  Navigator.pushNamed(
                                      context, '/pendaftaranSukses',
                                      arguments: {
                                        'id_pasien': pasienId,
                                        'nama_pasien': nameController.text,
                                        'tipe_layanan': appTitle,
                                        'tanggal_kunjungan': dateController.text
                                      });
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: greenLightColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                'Daftar',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600),
                              )),
                        )),
                  ]),
            ),
          )),
    );
  }
}
