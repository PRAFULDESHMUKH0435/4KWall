import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fourkwall/Model/models.dart';
import 'package:fourkwall/View/DetailedImageScreen.dart';

class ReUsableCardForImage extends StatelessWidget {
    final String imageurl;
    const ReUsableCardForImage({super.key, required this.imageurl}); 
  @override
  Widget build(BuildContext context) {
    return Card(
            shadowColor: Colors.red,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(image: AssetImage(imageurl),fit: BoxFit.cover)
              ),
            ),
       );
  }
}


class ReUsableCardForGridImage extends StatelessWidget {
    final ImageDataModel model;
    final String title;
    const ReUsableCardForGridImage({super.key, required this.model,required this.title}); 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(model.publisherName=="bharatmatakijay"){
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedImageScreen(title: title, model: model)));
        }
      },
      child: Card(
              shadowColor: Colors.red,
              color: Colors.grey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  image: DecorationImage(image: CachedNetworkImageProvider(model.imageurl),fit: BoxFit.cover)
                ),
              ),
         ),
    );
  }
}