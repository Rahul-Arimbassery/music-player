// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allsongs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllSongsAdapter extends TypeAdapter<AllSongs> {
  @override
  final int typeId = 0;

  @override
  AllSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllSongs(
      songID: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AllSongs obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.songID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
