

import 'package:json_annotation/json_annotation.dart';
import 'package:lmsapp/Model/countrymodel.dart';

import 'StateModel.dart';
part 'StateResponse.g.dart';

@JsonSerializable()
class StateResponse{
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;
  @JsonKey(name :'responseMessage', defaultValue: "")
  final String responseMessage;

  @JsonKey(name: 'data', defaultValue: [])
  final List<StateModel> datastate;

  StateResponse({required this.responseCode, required this.responseMessage, required this.datastate});

  factory StateResponse.fromJson(Map<String, dynamic> json) => _$StateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StateResponseToJson(this);
}