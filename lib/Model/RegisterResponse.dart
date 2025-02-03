

import 'package:json_annotation/json_annotation.dart';
part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse{
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int ResponseCode;

  @JsonKey(name :'responseMessage', defaultValue: '')
  final String ResponseMessage;

  RegisterResponse({
    required this.ResponseCode ,
    required this.ResponseMessage
  });


  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

}