import 'package:flutter/material.dart';
import 'package:my_app/pages/loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        elevation: 0.0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'how.',
          style: TextStyle(fontSize: MediaQuery.of(context).size.height / 15),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Login/Signup'))
        ],
      ),
    );
  }
}
