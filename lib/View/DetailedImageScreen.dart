import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/CustomAppBar.dart';
import 'package:fourkwall/Constants/Utils.dart';
import 'package:fourkwall/Model/models.dart';
import 'package:fourkwall/Providers/splashscreenprovider.dart';
import 'package:provider/provider.dart';

class DetailedImageScreen extends StatefulWidget {
  final String title;
  final ImageDataModel model;

  const DetailedImageScreen({super.key, required this.title, required this.model});

  @override
  _DetailedImageScreenState createState() => _DetailedImageScreenState();
}

class _DetailedImageScreenState extends State<DetailedImageScreen> {
  Color defaultColor = Colors.grey;
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashScreenProvider>(context);
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: CustomAppBar(title: widget.title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Card for the image with shadow and border radius
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(widget.model.imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Information section below the image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Photo By: "),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                widget.model.publisherName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const SizedBox(width: 7,),
                            CircleAvatar(
                               radius: 15,
                               backgroundImage: NetworkImage(widget.model.publisherImageUrl),
                           )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("On: "),
                            GestureDetector(
                              onTap: (){
                                 print("Hi ${widget.model.photographerUsername}");
                                  provider.openLinkforunsplash(widget.model.photographerUsername);
                              },
                              child:  const Text(
                                "UnSplash",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Optional strip for download and share options
          if (isExpanded)
            Positioned(
              right: 20,
              bottom: 80,
              child: Container(
                margin: const EdgeInsets.only(bottom: 35.0),
                height: 200,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_outline, color: Colors.white),
                      onPressed: () {
                        provider.AddToLikedItem(widget.model.imageurl);
                        Utils.FlushBar(context, "Added To Liked Items", Colors.green, Icons.favorite);
                       },
                    ),
                    IconButton(
                      icon: const Icon(Icons.download, color: Colors.white),
                      onPressed: () {
                        // Handle download action here
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        // Handle share action here
                      },
                    ),
                    
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 14.0,right: 7.0),
        child: FloatingActionButton(
          onPressed: toggleExpand,
          backgroundColor: Colors.pink,
          child: Icon(isExpanded ? Icons.close : Icons.arrow_upward,color: Colors.white,),
        ),
      ),
    );
  }
}
