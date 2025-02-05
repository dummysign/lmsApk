
import 'package:json_annotation/json_annotation.dart';

import 'BookModel.dart';
part 'BookListResponse.g.dart';



@JsonSerializable()
class  BookListResponse {
  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;
  @JsonKey(name :'responseMessage', defaultValue: "")
  final String responseMessage;
  @JsonKey(name: 'data',defaultValue: [])
  final List<BookModel> data;

  BookListResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.data,
  });


 // BookListResponse({required this.responseCode, required this.responseMessage, required this.data});

  factory BookListResponse.fromJson(Map<String, dynamic> json) => _$BookListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}