import 'package:hive/hive.dart';

part 'models.g.dart'; // Required for the generated adapter

@HiveType(typeId: 0)
class ImageDataModel {
  @HiveField(0)
  final String imageurl;

  @HiveField(1)
  final int imagelikes;

  @HiveField(2)
  final String downloadurl;

  @HiveField(3)
  final String publisherName;

  @HiveField(4)
  final String publisherProfileUrl;

  @HiveField(5)
  final String publisherImageUrl;

  @HiveField(6) // New field for photographer's username
  final String photographerUsername;

  ImageDataModel({
    required this.imageurl,
    required this.imagelikes,
    required this.downloadurl,
    required this.publisherName,
    required this.publisherProfileUrl,
    required this.publisherImageUrl,
    required this.photographerUsername, // Add this field in constructor
  });
}
