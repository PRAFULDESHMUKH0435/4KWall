// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageDataModelAdapter extends TypeAdapter<ImageDataModel> {
  @override
  final int typeId = 0;

  @override
  ImageDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageDataModel(
      imageurl: fields[0] as String,
      imagelikes: fields[1] as int,
      downloadurl: fields[2] as String,
      publisherName: fields[3] as String,
      publisherProfileUrl: fields[4] as String,
      publisherImageUrl: fields[5] as String,
      photographerUsername: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.imageurl)
      ..writeByte(1)
      ..write(obj.imagelikes)
      ..writeByte(2)
      ..write(obj.downloadurl)
      ..writeByte(3)
      ..write(obj.publisherName)
      ..writeByte(4)
      ..write(obj.publisherProfileUrl)
      ..writeByte(5)
      ..write(obj.publisherImageUrl)
      ..writeByte(6)
      ..write(obj.photographerUsername);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
