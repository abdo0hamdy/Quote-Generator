import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task2/app_route.dart';


void main() {
  runApp(const ProviderScope(child : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern2Grow',
      initialRoute: '/',
      routes: AppRoute.routess,
      debugShowCheckedModeBanner: false,
    );
  }
}

