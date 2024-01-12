import 'package:flutter/material.dart';
import 'headerDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Default theme (light)
        // other theme properties...
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        // other dark theme properties...
      ),
      builder: (context, child) {
        return Theme(
          data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: child!,
        );
      },
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Home'),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              MyHeaderDrawer(),
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
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('isLoggedIn');
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.lightbulb_outline),
                title: const Text("Switch Theme"),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      _switchTheme();
                    });
                  },
                ),
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
      ),
    );
  }

  void _switchTheme() {
    _applyTheme(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void _applyTheme(ThemeMode themeMode) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt('themeMode', themeMode.index);
    });
  }
}
