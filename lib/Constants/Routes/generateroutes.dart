import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Routes/routes.dart';
import 'package:fourkwall/View/aboutUsScreen.dart';
import 'package:fourkwall/View/aiartscreen.dart';
import 'package:fourkwall/View/aivideosscreen.dart';
import 'package:fourkwall/View/homescreen.dart';
import 'package:fourkwall/View/likedwallpapersscreen.dart';
import 'package:fourkwall/View/motificationsscreen.dart';
import 'package:fourkwall/View/splashscreen.dart';

class Routes{
   static Route<dynamic>  generateRoutes(RouteSettings setting){
    switch(setting.name){
      case AppRoutes.splashscreen:
         return MaterialPageRoute(builder: (context)=> const SplashScreen());
      
      case AppRoutes.homescreen:
         return MaterialPageRoute(builder: (context)=>  const HomeScreen());
 
      case AppRoutes.likedwallpaperscreen:
         return MaterialPageRoute(builder: (context)=>  const LikedWallPapersScreen());

      case AppRoutes.aiartsscreen:
         return MaterialPageRoute(builder: (context)=>  const AiArtScreen());

      case AppRoutes.aivideosscreen:
         return MaterialPageRoute(builder: (context)=>  const AIVideoScreen());
      
      case AppRoutes.notificationscreen:
         return MaterialPageRoute(builder: (context)=>  const NotificationsScreen());

      case AppRoutes.aboutusscreen:
         return MaterialPageRoute(builder: (context)=>  const AboutUsScreen());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(body: Center(child: Text("No Route Found")),);
        }); 

    }
   }
}