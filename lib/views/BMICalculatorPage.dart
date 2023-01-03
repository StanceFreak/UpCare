import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  int currentIndex = 0;
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  double? bmiResult;
  String messageText = "";

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
            'Kalkulator BMI',
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderSelector('Laki-laki',
                          "assets/images/icons/male.png", whiteColor, 1),
                      SizedBox(width: 40),
                      GenderSelector('Perempuan',
                          "assets/images/icons/female.png", whiteColor, 2)
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tinggi (cm) :',
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: heightController,
                        decoration: InputDecoration(
                          hoverColor: whiteColor,
                          hintText: 'Masukkan tinggi badan anda dalam cm',
                          hintStyle: TextStyle(fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: darkBlueColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: darkBlueColor)),
                          filled: true,
                          fillColor: whiteColor,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Berat (kg) :',
                        style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: weightController,
                        decoration: InputDecoration(
                          hoverColor: whiteColor,
                          hintText: 'Masukkan berat badan anda dalam kg',
                          hintStyle: TextStyle(fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: darkBlueColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: darkBlueColor)),
                          filled: true,
                          fillColor: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.all(15),
                        width: 225,
                        height: 50,
                        child: TextButton(
                            onPressed: () {
                              calculateBMI();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: greenLightColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'Hitung BMI',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // SizedBox(height: 30),
                          Text(
                            bmiResult == null
                                ? '0.00'
                                : bmiResult!.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 35, color: darkBlueColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            messageText,
                            style: const TextStyle(
                                fontSize: 14, color: darkBlueColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kurus < 18.5",
                              style: const TextStyle(
                                  fontSize: 14, color: darkBlueColor)),
                          SizedBox(height: 5),
                          Text("Normal 18 - 24.99",
                              style: const TextStyle(
                                  fontSize: 14, color: darkBlueColor)),
                          SizedBox(height: 5),
                          Text("Kegemukan 25 - 26.99",
                              style: const TextStyle(
                                  fontSize: 14, color: darkBlueColor)),
                          SizedBox(height: 5),
                          Text("Obesitas >= 27",
                              style: const TextStyle(
                                  fontSize: 14, color: darkBlueColor)),
                          SizedBox(height: 5),
                        ],
                      )
                    ],
                  )
                ]),
          ),
        ));
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void calculateBMI() {
    final double? height = double.parse(heightController.value.text) / 100;
    final double? weight = double.parse(weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        messageText = "Isian berat dan tinggi badan masih kosong!";
      });
      return;
    }

    double calcResult = weight / (height * height);
    setState(() {
      bmiResult = calcResult;
      log(bmiResult.toString());
      if (calcResult < 18.5) {
        messageText = 'Kurus';
      } else if (calcResult < 25) {
        messageText = 'Normal';
      } else if (calcResult < 27) {
        messageText = 'Kegemukan';
      } else {
        messageText = 'Obesitas';
      }
    });
  }

  Widget GenderSelector(
      String textValue, String imageValue, Color colorValue, int indexValue) {
    return GestureDetector(
      onTap: () {
        changeIndex(indexValue);
      },
      child: Container(
        width: 120,
        child: Card(
          elevation: currentIndex == indexValue ? 3 : 1,
          color: currentIndex == indexValue ? colorValue : Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imageValue),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  textValue,
                  style: currentIndex == indexValue
                      ? TextStyle(fontWeight: FontWeight.w600)
                      : TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
