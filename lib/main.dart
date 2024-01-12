import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'about.dart';
import 'gallery.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan widget Flutter sudah terinisialisasi
  bool isLoggedIn = await checkLoginStatus(); // Periksa status login

  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light, // Default theme (light)
      // other theme properties...
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark, // Dark theme
      // other dark theme properties...
    ),
    home: isLoggedIn ? MainScreen() : LoginPage(), // Tampilkan halaman sesuai status login
  ));
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false; // Periksa nilai isLoggedIn dari SharedPreferences
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // other dark theme properties...
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AboutPage(),
    GalleryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        foregroundColor: Colors.white,
        leading: Image.asset(
          'assets/images/logo_UM.png',
        ),
        title: Text('APLIKASI UNIVERSITAS MULIA'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Gallery',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
