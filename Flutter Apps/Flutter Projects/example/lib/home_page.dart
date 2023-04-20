import 'package:example/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  double sVal = 1;
  @override
  Widget build(BuildContext context) {
    print('main build');
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    final exampleProvider = Provider.of<ExampleProvider>(context,
        listen:
            false); // this (listen = false) makes that every widget is not able to listen.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'example of Provider',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleProvider>(
            // use this to listen for a particular widget.
            builder: (context, value, child) {
              print('text widget build');
              return Center(
                child: Text(
                  value.num.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Column(
              children: [
                Slider(
                  value: value.sval,
                  onChanged: (newValue) {
                    print('slider widget');
                    sliderProvider.setSVal(newValue);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.red.withOpacity(value.sval),
                  ),
                )
              ],
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exampleProvider
              .setCount(); // this way the value of updated and is notified to all the listeners
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
