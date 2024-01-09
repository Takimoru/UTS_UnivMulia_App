import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
