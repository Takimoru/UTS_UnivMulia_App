import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer>{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.red[900],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage('images/logo_UM.png')
              ),
            ),
          ),

          const Text("Teknik Informatika", style: TextStyle(color: Colors.white, fontSize: 20),),
          const Text("IFB5K", style: TextStyle(color: Colors.white, fontSize: 14),),
        ],
      ),
    );
  }
}