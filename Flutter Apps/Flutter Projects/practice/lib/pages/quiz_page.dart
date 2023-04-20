import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice/Providers/provider.dart';
import 'package:practice/widgets/timer.dart';
import 'package:provider/provider.dart';

class FinalQuizPage extends StatefulWidget {
  FinalQuizPage({super.key});

  @override
  State<FinalQuizPage> createState() => _FinalQuizPageState();
}

class _FinalQuizPageState extends State<FinalQuizPage> {
  @override
  Widget build(BuildContext context) {
    print('widget build');

    final _formKey = GlobalKey<FormState>();

    TextEditingController _answerController = new TextEditingController();

    final timerProvider = Provider.of<TimerProvider>(context, listen: false);
    final objectProvider = Provider.of<ObjectProvider>(context);

    var num1 = objectProvider.num1;
    var num2 = objectProvider.num2;

    return Scaffold(
      appBar: AppBar(title: const Text("QUIZ PAGE")),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              // buildTime(),
              // Consumer<TimerProvider>(
              //   builder: ((context, value, child) {
              //     return buildTimer(value.timeLeft);
              //   }),
              // ),
              OurTimer(),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        num1.toString(),
                        style: TextStyle(fontSize: 70),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 50,
                          ),
                          Text(
                            num2.toString(),
                            style: TextStyle(fontSize: 70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _answerController,
                  decoration: const InputDecoration(
                    hintText: "Enter Your Answer",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Something";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_answerController.text == (num1 + num2).toString()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Correct answer !!!"),
                          duration: Duration(milliseconds: 300),
                        ));
                        objectProvider.setnum(10);
                        _answerController.dispose();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Wrong answer !!!"),
                          duration: Duration(milliseconds: 300),
                        ));
                      }
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
