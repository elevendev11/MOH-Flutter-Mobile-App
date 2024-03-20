// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  int errorCode = 0;
  String errorMessage = "";
  Map<String, dynamic>? response;
  if (json['errorCode'] != null) {
    errorCode = json['errorCode'] as int;
  }
  if (json['errorMessage'] != null) {
    errorMessage = json['errorMessage'] as String;
  }
  if (json['response'] != null) {
    response = json['response'];
  }

  return ApiResponse(
    errorCode,
    errorMessage,
    response,
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'response': instance.response,
    };
