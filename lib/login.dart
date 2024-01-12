import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'UNIVERSITAS MULIA',
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: 'Judson', color: Color(0xFFB71C1C)),
          ),
          const Text(
            'Technopreneur Campus',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, fontFamily: 'Judson', color: Color(0xFFB71C1C)),
          ),
          const SizedBox(height: 20.0),
          Image.asset(
            'assets/images/logo_UM.png',
            width: 150.0,
            height: 150.0,
          ),
          LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _saveSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 32.0),
          SizedBox(
            height: 55.0,
            width: 345.0,
            child: ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (username == 'MahasiswaUm' && password == 'LoginYes') {
                  await _saveSession();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid username or password. Please try again.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB71C1C)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Judson'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
