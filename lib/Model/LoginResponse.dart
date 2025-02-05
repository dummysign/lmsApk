
import 'package:json_annotation/json_annotation.dart';

import 'UserDeatils.dart';
part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;
  @JsonKey(name :'responseMessage', defaultValue: "")
  final String responseMessage;
  @JsonKey(name: 'data')
  final UserDeatils data;


  LoginResponse({required this.responseCode, required this.responseMessage, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}