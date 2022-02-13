// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:listview/Object.dart';
import 'package:listview/Screen/Detail_screen.dart';

class HomeScreen extends StatelessWidget {
  late List<FoodItems> foodList;
  late List<String> foodNames, popularFoods;

  HomeScreen() {
    foodList = [
      FoodItems(
          title: 'Soto',
          deskripsi:
              'Soto adalah sup tradisional Indonesia yang terutama terdiri dari kaldu, daging, dan sayuran. Banyak sup tradisional disebut soto, sedangkan sup yang dipengaruhi asing dan Barat disebut sop. ',
          mainphoto: 'images/soto.jpg',
          photos: [
            'https://cdn1.katadata.co.id/media/images/thumb/2021/11/11/Soto_Ayam-2021_11_11-16_34_42_5f526ac236adec3bcaa4bae05a665afa_620x413_thumb.jpg',
            'https://images.aws.nestle.recipes/resized/70b59c146daff9caf53baa4f2f880fce_Soto_Kudus_1500_700.jpg',
            'https://cdn.idntimes.com/content-images/post/20210908/188633896-1148280012336577-1077197520471515984-n-b668cfe82cd31976759899a2c698cc79_600x400.jpg',
          ]),
      FoodItems(
          title: 'Nasi Goreng',
          deskripsi:
              'Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega',
          mainphoto: 'images/nasgor.jpg',
          photos: [
            'https://asset.kompas.com/crops/riPGK5eD7amHKtv3dFNqioI6IqI=/13x7:700x465/780x390/data/photo/2021/09/24/614dc6865eb24.jpg',
            'https://asset.kompas.com/crops/LoolFyLWLjqtNLwXV_DzfQk3BT4=/3x0:700x465/780x390/data/photo/2021/04/08/606e886b972ac.jpeg',
            'https://cdn-2.tstatic.net/travel/foto/bank/images/kuliner-nasi-goreng-jawa-enak-untuk-menu-sarapan.jpg',
          ]),
      FoodItems(
          title: 'Rendang',
          deskripsi:
              'Rendang atau randang adalah masakan daging asli Indonesia yang berasal dari Minangkabau. Masakan ini dihasilkan dari proses memasak suhu rendah dalam waktu lama menggunakan aneka rempah-rempah dan santan.',
          mainphoto: 'images/rendang3.jpg',
          photos: [
            'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/resep-rendang.jpg',
            'https://www.dapurkintamani.com/wp-content/uploads/2021/05/rendang-daging-empuk.jpg',
            'https://cdn0-production-images-kly.akamaized.net/rM3_abtBi9tM8MD50EuU_Fvp0OM=/1x112:1000x675/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3245094/original/043061400_1600750232-shutterstock_1786027046.jpg',
          ]),
      FoodItems(
          title: 'Bakso',
          deskripsi:
              'Bakso atau baso adalah jenis bola daging yang lazim ditemukan pada masakan Indonesia. Bakso umumnya dibuat dari campuran daging sapi giling dan tepung tapioka, tetapi ada juga bakso yang terbuat dari daging ayam, ikan, atau udang bahkan daging kerbau.',
          mainphoto: 'images/bakso.jpg',
          photos: [
            'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/bakso-sapi-kuah-1.jpg',
            'https://mmc.tirto.id/image/otf/700x0/2019/07/13/bakso-istockphoto-copy_ratio-16x9.jpg',
            'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2020/12/15/2323505669.jpg',
          ]),
    ];
    foodNames = foodList.map((e) => e.title).toList();
    popularFoods = ['t'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Makanan'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: FoodSearch(
                        allFoods: foodNames, foodsSuggestion: popularFoods));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final FoodItems foodData = foodList[index];
          return InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(items: foodData);
            })),
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Container(
                        width: double.infinity,
                        child: Image.asset(
                          foodData.mainphoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    tag: foodData.title,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      foodData.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<String> {
  final List<String> allFoods;
  final List<String> foodsSuggestion;

  FoodSearch({required this.allFoods, required this.foodsSuggestion});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> wholeFoods = allFoods
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: wholeFoods.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(wholeFoods.elementAt(index)),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> wholeFoodsSuggestion = foodsSuggestion
        .where((elementSuggestion) =>
            elementSuggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: wholeFoodsSuggestion.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(wholeFoodsSuggestion[index]),
            ));
  }
}
