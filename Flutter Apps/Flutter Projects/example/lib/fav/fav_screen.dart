import 'package:example/fav/fav_provider.dart';
import 'package:example/fav/myfav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    print('main build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavItemScreen()));
              },
              icon: Icon(Icons.favorite))
        ],
        title: Text('Fav App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavItemProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectedItem.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItems(index);
                      }
                    },
                    title: Text('Item' + index.toString()),
                    trailing: value.selectedItem.contains(index)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
