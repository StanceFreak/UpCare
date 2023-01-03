import 'package:emr_mobile/model/Dokter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class KonsultasiDokterPage extends StatefulWidget {
  KonsultasiDokterPage({Key? key}) : super(key: key);

  @override
  State<KonsultasiDokterPage> createState() => _KonsultasiDokterPageState();
}

class _KonsultasiDokterPageState extends State<KonsultasiDokterPage> {
  final dbAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final dbReference = FirebaseDatabase.instance.ref();
  TextEditingController kkController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController diseaseDescController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String appTitle = 'Konsultasi Dokter';
  Dokter? selectedValue;
  DateTime? selectedDate;
  List<Dokter> listDokter = <Dokter>[
    Dokter('0', 'Dokter Spesialis Kandungan & Kebidanan'),
    Dokter('1', 'Dokter Spesialis Kulit & Kelamin'),
    Dokter('2', 'Dokter Spesialis THT'),
    Dokter('3', 'Dokter Spesialis Jiwa'),
    Dokter('4', 'Dokter Spesialis Penyakit Dalam'),
    Dokter('5', 'Dokter Spesialis Anak'),
    Dokter('6', 'Dokter Spesialis Mata'),
    Dokter('7', 'Dokter Umum'),
    Dokter('8', 'Dokter Gigi'),
    Dokter('9', 'Psikolog Klinis'),
    Dokter('10', 'Dokter Spesialis Saraf'),
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
          'Konsultasi Dokter',
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
                        'Pendaftaran Konsultasi Dokter',
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
                        'Pilih Dokter Spesialis',
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    hint: Text('--Pilih salah satu dokter--'),
                    value: selectedValue,
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih salah satu dokter yang tersedia';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
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
                    items:
                        listDokter.map<DropdownMenuItem<Dokter>>((Dokter item) {
                      return DropdownMenuItem(
                          value: item, child: Text(item.name));
                    }).toList(),
                    onChanged: (Dokter? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 7,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Deskripsi/Gejala penyakit yang diderita',
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 14),
                    controller: diseaseDescController,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Deskripsi/Gejala penyakit harus diisi';
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
                              final konsulDokterId = UniqueKey().hashCode;
                              final pasienId = 'KD' + phoneController.text;
                              if (_formKey.currentState!.validate()) {
                                await dbReference
                                    .child(dbAuth.currentUser!.uid)
                                    .child('data_pasien')
                                    .child('konsul_dokter')
                                    .child(konsulDokterId.toString())
                                    .set({
                                  'no_kk': kkController.text,
                                  'nama': nameController.text,
                                  'no_hp': phoneController.text,
                                  'kebutuhan_dokter':
                                      selectedValue!.name.toString(),
                                  'deskripsi_penyakit':
                                      diseaseDescController.text,
                                  'tanggal_kunjungan': dateController.text
                                });
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //   content:
                                //       Text('Berhasil mendaftarkan rawat inap'),
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
        ),
      ),
    );
  }
}
