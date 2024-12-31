// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 0;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      address: fields[1] as String?,
      societyName: fields[0] as String?,
      floorName: fields[2] as String?,
      landMark: fields[3] as String?,
    )..addressType = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.societyName)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.floorName)
      ..writeByte(3)
      ..write(obj.landMark)
      ..writeByte(4)
      ..write(obj.addressType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
