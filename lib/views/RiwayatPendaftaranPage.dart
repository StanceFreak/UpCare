import 'package:flutter/material.dart';

class RiwayatPendaftaranPage extends StatefulWidget {
  RiwayatPendaftaranPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPendaftaranPage> createState() => _RiwayatPendaftaranPageState();
}

class _RiwayatPendaftaranPageState extends State<RiwayatPendaftaranPage> {
  List<Map> rawjal = [
    {
      'pasien_id': 'RJ083264682237492',
      'nama_pasien': 'Yanto Kusumonegoro',
      'email': 'yanto.k@gmail.com',
      'tanggal_kunjungan': '2022-12-04'
    }
  ];
  List<Map> rawin = [
    {
      'pasien_id': 'RI085761253476512',
      'nama_pasien': 'Lia Nurwati',
      'email': 'lia.nur@gmail.com',
      'tanggal_kunjungan': '2022-12-18'
    }
  ];
  List<Map> konsulDokter = [
    {
      'pasien_id': 'KD0852673545328',
      'nama_pasien': 'Budi Cokrokusumo',
      'email': 'b.cokrok@gmail.com',
      'tanggal_kunjungan': '2022-12-01'
    }
  ];
  List<Map> cekKesehatan = [
    {
      'pasien_id': 'CK0883254732787',
      'nama_pasien': 'yanto kusumonegoro',
      'email': 'yanto.k@gmail.com',
      'tanggal_kunjungan': '2022-12-04'
    }
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
            onPressed: () => Navigator.of(context).pop(context)),
        title: Text(
          'Riwayat Pendaftaran',
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rawat Jalan',
              style: TextStyle(
                  color: darkBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: kolom(), rows: baris(rawjal))),
            SizedBox(height: 15),
            Text(
              'Rawat Inap',
              style: TextStyle(
                  color: darkBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: kolom(), rows: baris(rawin))),
            SizedBox(height: 15),
            Text(
              'Cek Kesehatan',
              style: TextStyle(
                  color: darkBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: kolom(), rows: baris(cekKesehatan))),
            SizedBox(height: 15),
            Text(
              'Konsultasi Dokter',
              style: TextStyle(
                  color: darkBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: kolom(), rows: baris(konsulDokter))),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  List<DataColumn> kolom() {
    return [
      DataColumn(label: Text('Pasien ID')),
      DataColumn(label: Text('Nama Pasien')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Tanggal Kunjungan')),
    ];
  }

  List<DataRow> baris(List<Map> data) {
    return data
        .map((item) => DataRow(cells: [
              DataCell(Text(data[0]['pasien_id'].toString())),
              DataCell(Text(data[0]['nama_pasien'].toString())),
              DataCell(Text(data[0]['email'].toString())),
              DataCell(Text(data[0]['tanggal_kunjungan'].toString())),
            ]))
        .toList();
  }
}
