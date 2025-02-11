import 'package:json_annotation/json_annotation.dart';

part 'IssueModel.g.dart'; // Required for JSON serialization

@JsonSerializable()
class IssueModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'memberid', defaultValue: "")
  final String memberid;

  @JsonKey(name: 'membername', defaultValue: '')
  final String membername;

  @JsonKey(name: 'dep', defaultValue: '')
  final String dep;

  @JsonKey(name: 'sem', defaultValue: '')
  final String sem;

  @JsonKey(name: 'contact', defaultValue: '')
  final String contact;

  @JsonKey(name: 'issueDate', defaultValue: '')
  final String issueDate;

  @JsonKey(name: 'returnDate', defaultValue: '')
  final String returnDate;

  @JsonKey(name: 'bookname', defaultValue: '')
  final String bookname;

  @JsonKey(name: 'publisherid', defaultValue: "")
  final String publisherid;

  @JsonKey(name: 'publisherName', defaultValue: '')
  final String publisherName;

  @JsonKey(name: 'authorid', defaultValue: "")
  final String authorid;

  @JsonKey(name: 'authorName', defaultValue: '')
  final String authorName;

  @JsonKey(name: 'bookid', defaultValue: "")
  final String bookid;

  @JsonKey(name: 'issuestatus', defaultValue: '')
  final String issuestatus;

  // 🔹 Corrected Constructor
  IssueModel({
    required this.id,
    required this.memberid,
    required this.membername,
    required this.dep,
    required this.sem,
    required this.contact,
    required this.issueDate,
    required this.returnDate,
    required this.bookname,
    required this.publisherid,
    required this.publisherName,
    required this.authorid,
    required this.authorName,
    required this.bookid,
    required this.issuestatus,
  });

  // 🔹 Corrected Factory Method
  factory IssueModel.fromJson(Map<String, dynamic> json) => _$IssueModelFromJson(json);
  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}
