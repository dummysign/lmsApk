
import 'package:json_annotation/json_annotation.dart';
part 'BookModel.g.dart';





@JsonSerializable()
class BookModel {
  @JsonKey(name :'bid', defaultValue: 0)
  final int bid;

  @JsonKey(name :'bname', defaultValue: "")
  final String bname;

  @JsonKey(name :'bPdate', defaultValue: '')
  final String bPdate;

  @JsonKey(name :'bPrice', defaultValue: '')
  final String bPrice;


  @JsonKey(name :'bQuan', defaultValue: '')
  final String bQuan;

  @JsonKey(name :'publisherid', defaultValue: '')
  final String publisherid;


  @JsonKey(name :'publisherName', defaultValue: '')
  final String publisherName;

  @JsonKey(name :'authName', defaultValue: '')
  final String authName;

  @JsonKey(name :'authid', defaultValue: '')
  final String authid;

  @JsonKey(name :'edition', defaultValue: '')
  final String edition;

  @JsonKey(name :'langid', defaultValue: '')
  final String langid;

  @JsonKey(name :'noPage', defaultValue: '')
  final String noPage;

  @JsonKey(name :'generId', defaultValue: '')
  final String generId;

  @JsonKey(name :'bookImage', defaultValue: '')
  final String bookImage;

  BookModel({
    required this.bid,
    required this.bname,
    required this.bPdate,
    required this.bPrice,
    required this.bQuan,
    required this.publisherid,
    required this.authid,
    required this.edition,
    required this.langid,
    required this.noPage,
    required this.generId,
    required this.bookImage,
    required this.authName,
    required this.publisherName,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}