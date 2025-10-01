// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTodoModelAdapter extends TypeAdapter<HiveTodoModel> {
  @override
  final int typeId = 3;

  @override
  HiveTodoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTodoModel(
      name: fields[0] as String,
      age: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTodoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
