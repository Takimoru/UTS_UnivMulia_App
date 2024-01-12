import 'package:flutter/material.dart';
import 'headerDrawer.dart'; // Pastikan file dan path-nya sudah sesuai
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('About'),
        ),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              Text(
                'Reyvaldi Nur Rahmatullah',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Saya adalah mahasiswa Teknik Informatika di Universitas Mulia Balikpapan',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 500),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/Nico.jpg'),
                ),
              ),
              Text(
                'Nicolaos Tzakis',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Saya adalah mahasiswa Teknik Informatika di Universitas Mulia Balikpapan',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
