// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class MyTodoModelAdapter extends TypeAdapter<MyTodoModel> {
  @override
  final int typeId = 0;

  @override
  MyTodoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTodoModel(
      surahName: fields[0] as String,
      fromAyahNumber: (fields[1] as num).toInt(),
      toAyahNumber: (fields[2] as num).toInt(),
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyTodoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.surahName)
      ..writeByte(1)
      ..write(obj.fromAyahNumber)
      ..writeByte(2)
      ..write(obj.toAyahNumber)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
