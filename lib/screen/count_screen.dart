import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CountWithProvider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              print("Only consumer");
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
          ElevatedButton(
            onPressed: () {
              countProvider.decrement();
            },
            child: const Text('Decrement'),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () {
            countProvider.increment(); // Increment the count on button press
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
