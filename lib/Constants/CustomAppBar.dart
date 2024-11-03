import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Styles/appstyles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.black87,
      title: Text(title,style:Appstyles.customappbarstyle,),
    );
  }
}