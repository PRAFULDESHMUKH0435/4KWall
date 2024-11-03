import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/CustomAppBar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: CustomAppBar(title: "About Us")),
        bottomNavigationBar: Container(
          height: 50,
          color:Colors.black87,
          child: const Center(child: Text("Ad Section",style: TextStyle(color: Colors.white),)),
        ),
    );
  }
}