import 'package:flutter/material.dart';
import 'package:practice/Providers/provider.dart';
import 'package:practice/example.dart';
import 'package:practice/pages/quiz_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var current = 10;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz APP'),
      ),
      body: Center(
        child: Container(
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The value of the number is ${value.num}'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(),
                        ),
                      );
                    },
                    child: Text("QUIZ PAGE"),
                  ),
                  Text('$current'),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeProvider.setnum();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
