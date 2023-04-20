import 'package:example/fav/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavItemScreen extends StatelessWidget {
  const MyFavItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final favItemProvider = Provider.of<FavItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Fav Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.selectedItem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        value.removeItem(value.selectedItem[index]);
                      },
                      title:
                          Text("Item " + value.selectedItem[index].toString()),
                      trailing: Icon(Icons.favorite),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
