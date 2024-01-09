import 'package:flutter/material.dart';
import 'headerDrawer.dart'; // Pastikan file dan path-nya sudah sesuai

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text('Home'),
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
              onTap: () {Navigator.pop(context);},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/logo_UM1.png',
              ),
            ),
            Text(
              'Selamat Datang !!!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}