// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanItemAdapter extends TypeAdapter<PlanItem> {
  @override
  final int typeId = 1;

  @override
  PlanItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlanItem(
      planDuration: fields[0] as String?,
      planType: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlanItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.planDuration)
      ..writeByte(1)
      ..write(obj.planType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
