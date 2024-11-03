import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/CustomAppBar.dart';

class AIVideoScreen extends StatelessWidget {
  const AIVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: CustomAppBar(title: "AI Videos")),
    );
  }
}