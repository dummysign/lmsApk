

import 'package:json_annotation/json_annotation.dart';

import 'IssueModel.dart';
part 'RequestListResponse.g.dart';

@JsonSerializable()
class RequestListResponse {
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;
  @JsonKey(name :'responseMessage', defaultValue: "")
  final String responseMessage;
  @JsonKey(name: 'data',defaultValue: [])
  final List<IssueModel> data;

  RequestListResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.data,
  });


  // BookListResponse({required this.responseCode, required this.responseMessage, required this.data});

  factory RequestListResponse.fromJson(Map<String, dynamic> json) => _$RequestListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RequestListResponseToJson(this);
}