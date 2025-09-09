// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limits_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LimitsModelAdapter extends TypeAdapter<LimitsModel> {
  @override
  final int typeId = 3;

  @override
  LimitsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LimitsModel(
      monthlyLimit: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LimitsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.monthlyLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LimitsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
