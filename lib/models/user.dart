import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  String? password;

  @HiveField(4)
  String? tokenId;

  @HiveField(5)
  String? image;

  @HiveField(6)
  int? assesmentStatus;

  @HiveField(7)
  String? phoneNo;

  @HiveField(8)
  String? gender;

  @HiveField(9)
  DateTime? dob;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    this.tokenId,
    this.image,
    this.assesmentStatus,
    this.phoneNo,
    this.gender,
    this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
