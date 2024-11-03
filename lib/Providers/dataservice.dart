import 'dart:convert';
import 'package:fourkwall/Model/models.dart';
import 'package:fourkwall/Providers/splashscreenprovider.dart';
import 'package:http/http.dart' as http;

class DataService {

  static List<List<ImageDataModel>> allImagesDataList = [];
  SplashScreenProvider splashScreenProvider = SplashScreenProvider();

  static Future<List<dynamic>> FetchData(String url) async {
    try {
      List<ImageDataModel> itemslist =[];
      final response = await http.get(Uri.parse("$url&per_page=30"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['results'];
        print("Data Is $data");
        for(var mydata in data){
          ImageDataModel imageDataModel = ImageDataModel(
            imageurl: mydata['links']['download']??" ", 
            imagelikes: mydata['likes']??"", 
            downloadurl: " ",
            publisherName: mydata['user']['name']??" ", 
            photographerUsername: mydata['user']['username']??" ",
            publisherProfileUrl: mydata['user']['portfolio_url']??" ", 
            publisherImageUrl: mydata['user']['profile_image']['medium']??""
          );
          itemslist.add(imageDataModel);
        }
        return itemslist; 
      } else {
        // Handle non-200 response codes
        throw Exception("Failed to load data: ${response.body}");
      }
    } catch (e) {
      // Use a specific exception type
      throw Exception("Error Occurred: $e");
    }
  }
  

  // // Future<void> fetchData() async {
  // //   // Open Hive box
  // //   final hiveBox = await Hive.openBox("DataBox");
  // //   print("Inside Fetch");

  // //   try {
  // //     // Iterate through each endpoint
  // //     for (String eachUrl in UnsplashEndpoints.AllEndpoints) {
  // //       print("Fetching data from URL: $eachUrl");

  // //       // Fetch data from the endpoint
  // //       final response = await http.get(Uri.parse(eachUrl));

  // //       // Check if response is successful
  // //       if (response.statusCode == 200) {
  // //         print("Response for $eachUrl: ${response.body}");

  // //         // Decode the JSON response
  // //         var data = jsonDecode(response.body);
  // //         print("Response Data for $eachUrl: $data");

  // //         // Ensure 'results' key exists and is a list
  // //         if (data['results'] is List) {
  // //           List<ImageDataModel> tempList = [];

  // //           // Process each image data
  // //           for (var eachData in data['results']) {
  // //             ImageDataModel imageDataModel = ImageDataModel(
  // //               imageurl: eachData['urls']?['regular'] ?? "null",
  // //               imagelikes: eachData['likes'] ?? "null",
  // //               downloadurl: eachData['links']?['download'] ?? "null",
  // //               publisherName: eachData['user']?['name'] ?? "null",
  // //               publisherProfileUrl: eachData['user']?['portfolio_url'] ?? "null",
  // //               publisherImageUrl: eachData['user']?['profile_image']['medium'] ?? "null",
  // //             );
  // //             tempList.add(imageDataModel);
  // //           }
  // //           allImagesDataList.add(tempList);
  // //         } else {
  // //           print("Error: 'results' key is missing or is not a list.");
  // //         }
  // //       } else {
  // //         print("Error fetching data: HTTP status ${response.statusCode}");
  // //       }
  // //     }
  // //   } catch (e) {
  // //     if (e is SocketException) {
  // //       print("SocketException: ${e.message}");
  // //     } else {
  // //       print("Unhandled Exception: $e");
  // //     }
  // //     throw "Exception Occurred: $e";
  // //   }

  //   // Store data in Hive
  //   print("Before Hive");
  //   // await hiveBox.put("DATALIST", "Data Added");
  //   await hiveBox.put("DATALIST", allImagesDataList);
  //   print("Hive Key DATALIST Added and HiveBox Length Is ${hiveBox.values.length}");
  //   print("Final allImagesDataList size: ${allImagesDataList.length}");
  // }

}
