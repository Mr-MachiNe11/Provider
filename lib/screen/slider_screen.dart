import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliderWithProvider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
              },
              min: 0,
              max: 100,
              label: value.value.toString(),
            );
          }),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(value.value / 100),
                      ),
                      child: const Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(value.value / 100)),
                      child: const Center(child: Text("Container 2")),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
