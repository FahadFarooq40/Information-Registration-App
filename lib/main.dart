import 'package:flutter/material.dart';
import 'package:flutterfirstproject/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const profileView = NewWidget();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profileView,
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}
