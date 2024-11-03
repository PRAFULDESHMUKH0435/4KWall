import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Styles/appstyles.dart';
import 'package:fourkwall/Providers/splashscreenprovider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        precacheImage(const AssetImage("assets/images/splash_1.jpg"), context);
    });

    Timer(const Duration(seconds: 5),(){
      SplashScreenProvider.DataAlreadyPresentorNot(context);
      //  Navigator.pushReplacementNamed(context,AppRoutes.homescreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black87,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash_1.jpg"),fit: BoxFit.cover)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0), 
              child: Text("4K Wall : WallPapers And Images ",style:Appstyles.splashappstyle,)),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}