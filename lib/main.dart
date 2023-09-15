import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unclean_app/pages/screen_resolver/screen_resolver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Timer.periodic(const Duration(seconds: 1), (Timer t) async {
  //   final String memoryUsage = await getCurrentMemoryUsage();
  //   print('Rss usage: $memoryUsage');
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'unclean_app',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: ScreenResolver(),
        ),
      ),
    );
  }
}

Future<String> getCurrentMemoryUsage() async {
  final int memoryUsage = ProcessInfo.currentRss;
  final double memoryUsageInMB = memoryUsage / (1024 * 1024);
  memoryUsageInMB.toStringAsFixed(2);
  return '$memoryUsageInMB MB';
}
