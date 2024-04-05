import 'package:flutter/material.dart';
import 'package:project/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ClickProvider(),
        child: const MaterialApp(home: Home()));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          const Text('Flutter Provider Task'),
          const SizedBox(height: 40),
          Consumer<ClickProvider>(builder: (context, clickprovider, child) {
            return Container(
                child: clickprovider.isClicked == false
                    ? const Icon(Icons.person)
                    : const CircularProgressIndicator());
          }),
          const SizedBox(height: 20),
          Consumer<ClickProvider>(builder: (context, clickprovider, child) {
            return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: clickprovider.isClicked == false
                        ? const MaterialStatePropertyAll(Colors.blue)
                        : const MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  clickprovider.isClick();
                },
                child: Consumer<ClickProvider>(
                    builder: (context, clickprovider, child) {
                  return Text(
                      clickprovider.isClicked == false ? 'Start' : 'Stop');
                }));
          })
              ],
            ),
        ));
  }
}
