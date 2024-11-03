import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Routes/routes.dart';
import 'package:fourkwall/Constants/Utils.dart';
import 'package:fourkwall/Providers/dataservice.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreenProvider with ChangeNotifier{

  static bool _internetavailable = true;
  List<String> likeditemsimageurls=[];
  static final likeditemsbox = Hive.box("LikedItems");

  bool get internetavailable => _internetavailable;

  set internetavailable(bool value) {
    _internetavailable = value;
    notifyListeners();
  }

    static DataService dataservice = DataService();
    
    static DataAlreadyPresentorNot(BuildContext context) async{
        Navigator.pushReplacementNamed(context, AppRoutes.homescreen);
    }

CheckInternetConnection(BuildContext context) async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet) || connectivityResult.contains(ConnectivityResult.vpn) || connectivityResult.contains(ConnectivityResult.bluetooth) || connectivityResult.contains(ConnectivityResult.other)) {
      print(" INTERNET AVAILABLE WITH $connectivityResult");
      _internetavailable=true;
      notifyListeners();
    }else if (connectivityResult.contains(ConnectivityResult.none)) {
      _internetavailable=false;
      notifyListeners();
      Utils.FlushBar(context, "No Internet Connection", Colors.red,Icons.wifi);
      print("NO INTERNET AVAILABLE");
    }
  }


  // Function to open the link in the browser
  Future<void> openLinkforunsplash(String photographeruserName) async {
    final String url = "https://unsplash.com/@$photographeruserName?utm_source=4KWall&utm_medium=referral";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  AddToLikedItem(String imageurl) {
    if(likeditemsbox.containsKey("likeditems")){
      List alreadypresentitems = likeditemsbox.values.toList();
      alreadypresentitems.add(imageurl);
      likeditemsbox.clear();
      likeditemsbox.put("likeditems", alreadypresentitems);
    }else{
      likeditemsbox.put("likeditems", imageurl);
    }
    print("LikedItems Are ${likeditemsbox.values} And Size Is ${likeditemsbox.values.length}");
    notifyListeners();
  }
  

}