import 'package:flutter/material.dart';

class NotifyListenerPage extends StatelessWidget {
  NotifyListenerPage({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(
      0); // it is used to make the provider without the class

  ValueNotifier<bool> _passVisibility = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notify listener App"),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(_counter.value.toString());
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: _passVisibility,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: (!_passVisibility.value) ? true : false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.password),
                      suffix: IconButton(
                        icon: (!_passVisibility.value)
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          _passVisibility.value = !(_passVisibility.value);
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
