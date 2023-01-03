import 'dart:developer';

import 'package:UpCare/services/APIServices.dart';
import 'package:UpCare/views/HomePage.dart';
import 'package:UpCare/views/MedicineListPage.dart';
import 'package:UpCare/views/ShimmerEffect.dart';
import 'package:flutter/material.dart';

class MedicineCategoriesPage extends StatefulWidget {
  const MedicineCategoriesPage({Key? key}) : super(key: key);

  @override
  State<MedicineCategoriesPage> createState() => _MedicineCategoriesPageState();
}

class _MedicineCategoriesPageState extends State<MedicineCategoriesPage> {
  Service apiService = Service();
  late Future<List<dynamic>> medicineCategoryList;

  @override
  void initState() {
    super.initState();
    // medicineCategoryList = APIServices.getMedicineCategories();
    APIServices.getMedicineCategories();
  }

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);

    return Scaffold(
      backgroundColor: whiteColor,
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
          'Vitamin & Suplemen',
          style: TextStyle(
              color: whiteColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  child: FutureBuilder<List<dynamic>>(
                    future: APIServices.getMedicineCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> data = snapshot.data!;
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MedicineListPage(
                                                slug: snapshot.data![index]
                                                    ['slug'],
                                                medicineCategories: snapshot
                                                    .data![index]['attributes']
                                                        ['name']
                                                    .toString(),
                                              )));
                                },
                                child: Container(
                                    constraints: BoxConstraints(maxWidth: 200),
                                    padding: EdgeInsets.all(5),
                                    child: ListTile(
                                      leading: Image.network(
                                        snapshot.data![index]['images_map']
                                            ['image_url'][1]['url'],
                                        fit: BoxFit.fill,
                                      ),
                                      title: Container(
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: Text(
                                          snapshot.data![index]['attributes']
                                                  ['name']
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: darkBlueColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['attributes']
                                                ['meta_title']
                                            .toString(),
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: darkBlueColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.5),
                                      ),
                                    )),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('$snapshot.error');
                      }
                      return ShimmerPlaceholder();
                    },
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemLength = 20;

    return Container(
      child: ListView.builder(
        itemCount: itemLength,
        itemBuilder: (context, index) {
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
        },
      ),
    );
  }
}

// const itemLength = 26;

// Widget ShimmerPlaceholder2() => ListView.builder(
//       itemCount: itemLength,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: ShimmerEffect.rectangular(height: 100, width: 100),
//           title: Align(
//             alignment: Alignment.centerLeft,
//             child: ShimmerEffect.rectangular(
//               height: 16,
//               width: double.infinity,
//             ),
//           ),
//           subtitle: ShimmerEffect.rectangular(height: 14),
//         );
//       },
//     );
