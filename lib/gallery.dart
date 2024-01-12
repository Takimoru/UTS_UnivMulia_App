import 'package:flutter/material.dart';
import 'headerDrawer.dart'; // Pastikan file dan path-nya sudah sesuai
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            MyHeaderDrawer(), // Memanggil widget header drawer di sini
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Pengaturan"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Berlangganan"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text("Log Out"),
              onTap: () async {
                // Fungsi logout di sini
                // Misalnya, hapus session dan kembali ke halaman login
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('isLoggedIn');
                Navigator.pop(context); // Tutup drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Contoh kembali ke halaman login
              },
            ),

          ],
        ),
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
