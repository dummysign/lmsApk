

import 'package:json_annotation/json_annotation.dart';
import 'package:lmsapp/Model/countrymodel.dart';

import 'StateModel.dart';
part 'CountryResponse.g.dart';

@JsonSerializable()
class CountryResponse{
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;
  @JsonKey(name :'responseMessage', defaultValue: "")
  final String responseMessage;
  @JsonKey(name: 'data', defaultValue: [])
  final List<countrymodel> data;

  CountryResponse({required this.responseCode, required this.responseMessage, required this.data});

  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}