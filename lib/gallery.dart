import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
    'assets/images/logo_UM.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child:Text('Galery'),
          )
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: images.map((image) {
            return GestureDetector(
              onTap: () {
                // Tambahkan aksi yang ingin dilakukan saat gambar ditekan
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
