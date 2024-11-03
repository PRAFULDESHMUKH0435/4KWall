import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/CustomAppBar.dart';
import 'package:fourkwall/Constants/ReUsableCardForImage.dart';
import 'package:fourkwall/Model/models.dart';
import 'package:fourkwall/Providers/splashscreenprovider.dart';
import 'package:hive/hive.dart';

class LikedWallPapersScreen extends StatefulWidget {
   const LikedWallPapersScreen({super.key});

  @override
  State<LikedWallPapersScreen> createState() => _LikedWallPapersScreenState();
}

class _LikedWallPapersScreenState extends State<LikedWallPapersScreen> {
static List<dynamic> imageurls=[];
final box =  Hive.box("LikedItems");


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Future getallimageurls() async{
    final box = Hive.box("LikedItems");
    if(box.containsKey("likeditems")){
      imageurls=box.get("likeditems");
    }
    print("ImageUrls List Are $imageurls AND Size Is ${imageurls.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: CustomAppBar(title: "Liked WallPapers \u2764\uFE0F ")),
        bottomNavigationBar: Container(
          height: 50,
          color:Colors.black87,
          child: const Center(child: Text("Ad Section",style: TextStyle(color: Colors.white),)),
        ),

        body:box.values.isEmpty?
        Container(child: const Center(child: Text("No Items Found")),)
        :FutureBuilder(
          future: getallimageurls(), 
          builder: (context,snaphot){
            if(snaphot.connectionState==ConnectionState.waiting){
               return const Center(child: CircularProgressIndicator());
            }else if(snaphot.connectionState==ConnectionState.active ||snaphot.connectionState==ConnectionState.done){
              return GridView.builder(
           itemCount: imageurls.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
           itemBuilder: (context,index){
            ImageDataModel model = ImageDataModel(
                imageurl: imageurls[index], 
                imagelikes: 0, 
                downloadurl: "null",
                publisherName: "bharatmatakijay",
                publisherProfileUrl: "null", 
                publisherImageUrl: "null", 
                photographerUsername: "null");
            return ReUsableCardForGridImage(
              model: model, 
              title: "title");
           });
            }else{
              return const Text("Something Went Wromg");
            }
          }),
    );
  }
}