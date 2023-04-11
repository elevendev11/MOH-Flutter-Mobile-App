// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String?,
      tokenId: fields[4] as String?,
      image: fields[5] as String?,
      assesmentStatus: fields[6] as int?,
      phoneNo: fields[7] as String?,
      gender: fields[8] as String?,
      dob: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.tokenId)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.assesmentStatus)
      ..writeByte(7)
      ..write(obj.phoneNo)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.dob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      tokenId: json['tokenId'] as String?,
      image: json['image'] as String?,
      assesmentStatus: json['assesmentStatus'] as int?,
      phoneNo: json['phoneNo'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'tokenId': instance.tokenId,
      'image': instance.image,
      'assesmentStatus': instance.assesmentStatus,
      'phoneNo': instance.phoneNo,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
    };
