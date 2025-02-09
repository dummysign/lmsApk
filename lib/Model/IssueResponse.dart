

import 'package:json_annotation/json_annotation.dart';
part 'IssueResponse.g.dart';

@JsonSerializable()
class IssueResponse {
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;

  @JsonKey(name :'responseMessag', defaultValue: "")
  final String responseMessag;

  IssueResponse({
    required this.responseCode,
    required this.responseMessag,
  });


  // BookListResponse({required this.responseCode, required this.responseMessage, required this.data});

  factory IssueResponse.fromJson(Map<String, dynamic> json) => _$IssueResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IssueResponseToJson(this);
}