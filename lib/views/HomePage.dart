import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emr_mobile/custom_icons_icons.dart';
import 'package:emr_mobile/model/ArticleResponse.dart';
import 'package:emr_mobile/nav_icons_icons.dart';
import 'package:emr_mobile/services/APIServices.dart';
import 'package:emr_mobile/views/BMICalculatorPage.dart';
import 'package:emr_mobile/views/CekKesehatanPage.dart';
import 'package:emr_mobile/views/KonsultasiDokterPage.dart';
import 'package:emr_mobile/views/MedicineCategoriesPage.dart';
import 'package:emr_mobile/views/RawatInapPage.dart';
import 'package:emr_mobile/views/RawatJalanPage.dart';
import 'package:emr_mobile/views/ShimmerEffect.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emr_mobile/model/Results.dart';
import 'RegisterUser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNavBar = 0;
  Service apiService = Service();
  late Future<List<dynamic>> articleList;
  late Future<List<dynamic>> trendingArticleList;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleList = APIServices.getListArticles();
    trendingArticleList = APIServices.getTrendingArticles();
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      selectedNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);
    const blueColor = Color(0xFF77ACF1);

    return Scaffold(
      // return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenLightColor,
        elevation: 0,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/icons/male.png"),
                radius: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Halo, user!',
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Stack(children: [
                      ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          height: 225,
                          width: double.infinity,
                          color: greenLightColor,
                        ),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Layanan yang tersedia',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/003-stretcher.png",
                                            namaLayanan: "Rawat \n Inap",
                                            navigatorRoute: RawatInapPage(),
                                          ),
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/035-doctor.png",
                                            namaLayanan: "Konsultasi \n Dokter",
                                            navigatorRoute:
                                                KonsultasiDokterPage(),
                                          ),
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/004-wheelchair.png",
                                            namaLayanan: "Rawat \n Jalan",
                                            navigatorRoute: RawatJalanPage(),
                                          ),
                                          // listLayanan(
                                          //   iconLayanan:
                                          //       "assets/images/icons/006-medical report.png",
                                          //   namaLayanan: "Rekam \n Medis",
                                          //   navigatorRoute:
                                          //       MedicineCategoriesPage(),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/036-stethoscope.png",
                                            namaLayanan: "Cek \n Kesehatan",
                                            navigatorRoute: CekKesehatanPage(),
                                          ),
                                          // listLayanan(
                                          //   iconLayanan:
                                          //       "assets/images/icons/050-emergency call.png",
                                          //   namaLayanan: "Telepon \n Darurat",
                                          //   navigatorRoute:
                                          //       MedicineCategoriesPage(),
                                          // ),
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/043-scale.png",
                                            namaLayanan: "Kalkulator \n BMI",
                                            navigatorRoute: BMICalculatorPage(),
                                          ),
                                          listLayanan(
                                            iconLayanan:
                                                "assets/images/icons/017-drugs.png",
                                            namaLayanan:
                                                "Vitamin & \n Suplemen",
                                            navigatorRoute:
                                                MedicineCategoriesPage(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(height: 15),
                    ArticleListBuilder(
                        TitleList: 'Sedang Panas',
                        FutureData: trendingArticleList),
                    SizedBox(height: 15),
                    ArticleListBuilder(
                        TitleList: 'Artikel Kesehatan', FutureData: articleList)
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleListBuilder extends StatelessWidget {
  const ArticleListBuilder(
      {Key? key, required this.TitleList, required this.FutureData})
      : super(key: key);

  final String TitleList;
  final Future<List<dynamic>> FutureData;

  @override
  Widget build(BuildContext context) {
    const darkBlueColor = Color(0xFF233b43);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  TitleList,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: darkBlueColor),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 25),
                child: RichText(
                  text: TextSpan(
                      text: 'Lihat Semua',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: darkBlueColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterUser()));
                        }),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          FutureBuilder<List<dynamic>>(
            future: FutureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = snapshot.data!;
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      snapshot.data!.length < 5 ? snapshot.data!.length : 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: Image.network(
                              snapshot.data![index]['thumbnail_url'],
                              fit: BoxFit.fill,
                            ),
                            title: Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text(
                                snapshot.data![index]['title'].toString(),
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    height: 1.2),
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data![index]['summary'].toString(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  height: 1.5),
                            ),
                          )),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('$snapshot.error');
              }
              return ShimmerPlaceholder();
            },
          ),
        ],
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimmerEffect.rectangular(height: 100, width: 100),
      title: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerEffect.rectangular(
          height: 16,
          width: double.infinity,
        ),
      ),
      subtitle: ShimmerEffect.rectangular(height: 14),
    );
  }
}

class listLayanan extends StatelessWidget {
  const listLayanan(
      {Key? key,
      required this.iconLayanan,
      required this.namaLayanan,
      required this.navigatorRoute})
      : super(key: key);

  final String iconLayanan;
  final String namaLayanan;
  final Widget navigatorRoute;

  @override
  Widget build(BuildContext context) {
    const whiteColor = Color(0xFFF2F3F5);
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);

    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => navigatorRoute));
      },
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(
              iconLayanan,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Text(
            namaLayanan,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: darkBlueColor,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          )
        ],
      )),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
