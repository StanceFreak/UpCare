import 'dart:developer';
import 'dart:io';

import 'package:UpCare/views/MedicineListPage.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePage extends StatefulWidget {
  QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? results;
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    // this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        results = scanData;
        log(results.toString());
        // Navigator.pushNamed(context, MedicineListPage.route,
        //     arguments: results);
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);
    const blueColor = Color(0xFF77ACF1);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: greenLightColor,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8)),
          ],
        ),
      ),
    );
  }
}
