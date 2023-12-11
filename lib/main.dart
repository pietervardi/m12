import 'dart:io';
import 'package:flutter/material.dart';
import 'package:minggu_12/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: ElevatedButton(
      //       child: const Text('Calculate fibo on compute isolate'),
      //       onPressed: () {
      //         compute(backgroundCompute, null);
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  void backgroundCompute(args) {
    print('background compute callback');
    print('calculating fibonacci from a background process');

    int first = 0;
    int second = 1;
    for (var i = 2; i <= 50; i++) {
      var temp = second;
      second = first + second;
      first = temp;
      sleep(const Duration(microseconds: 200));
      print('first: $first, second: $second.');
    }
    print('finished calculating fibo');
  }
}
