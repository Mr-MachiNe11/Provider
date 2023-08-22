import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/favourite/myFavourite.dart';
import 'package:provider_practice/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavouriteApp'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyFavouriteScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      title: Text('item $index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                      onTap: () {
                        value.selectedItem.contains(index)
                            ? value.removeItem(index)
                            : value.addItem(index);
                      },
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
