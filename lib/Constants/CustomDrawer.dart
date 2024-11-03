import 'package:flutter/material.dart';
import 'package:fourkwall/View/aboutUsScreen.dart';
import 'package:fourkwall/View/aiartscreen.dart';
import 'package:fourkwall/View/aivideosscreen.dart';
import 'package:fourkwall/View/likedwallpapersscreen.dart';
import 'package:fourkwall/View/motificationsscreen.dart';
import 'package:url_launcher/url_launcher.dart';
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
     precacheImage(const AssetImage("assets/images/splash_1.jpg"), context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // User Profile Header
          const UserAccountsDrawerHeader(
            accountName: Text(
              '4K Wall: Wallpaper and Images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: null, // You can add user email if needed
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/splash_1.jpg'), // Add your profile image here
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          // Options List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.black), // Icon color
                    title: const Text('Liked Wallpapers', style: TextStyle(color: Colors.black)),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LikedWallPapersScreen()));
                    },
                ),
                ListTile(
                    leading: const Icon(Icons.palette, color: Colors.black), // Icon color
                    title: const Text('AI Arts', style: TextStyle(color: Colors.black)),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AiArtScreen()));
                    },
                ),ListTile(
                    leading: const Icon(Icons.video_library, color: Colors.black), // Icon color
                    title: const Text('AI Videos', style: TextStyle(color: Colors.black)),
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AIVideoScreen()));
                    },
                ),ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.black), // Icon color
                    title: const Text('Notification', style: TextStyle(color: Colors.black)),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationsScreen()));
                    },
                ),ListTile(
                    leading: const Icon(Icons.privacy_tip, color: Colors.black), // Icon color
                    title: const Text('Privacy Policy', style: TextStyle(color: Colors.black)),
                    onTap: (){
                      launchUrl("https://play.google.com/store/apps/details?id=appveda.bmi.bmicalculator");
                    },
                ),ListTile(
                    leading: const Icon(Icons.info, color: Colors.black), // Icon color
                    title: const Text('About Us', style: TextStyle(color: Colors.black)),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUsScreen()));
                    },
                ),ListTile(
                    leading: const Icon(Icons.apps, color: Colors.black), // Icon color
                    title: const Text('More Apps', style: TextStyle(color: Colors.black)),
                    onTap: (){},
                ),
                const Divider(height: 5.0,color:Colors.black,),
                ListTile(
                    leading: const Icon(Icons.share, color: Colors.black), // Icon color
                    title: const Text('Share App', style: TextStyle(color: Colors.black)),
                    onTap: (){},
                ),ListTile(
                    leading: const Icon(Icons.star, color: Colors.black), // Icon color
                    title: const Text('Rate App', style: TextStyle(color: Colors.black)),
                    onTap: (){},
                ),ListTile(
                    leading: const Icon(Icons.contact_mail, color: Colors.black), // Icon color
                    title: const Text('Contact Us', style: TextStyle(color:Colors.black)),
                    onTap: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future launchUrl(url) async{
    print("Inside");
    try{
      await canLaunchUrl(Uri.parse(url));
    }catch(e){
      throw "Error Launching Url $e";
    }
  }
}