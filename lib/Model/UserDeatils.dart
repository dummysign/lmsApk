
import 'package:json_annotation/json_annotation.dart';
part 'UserDeatils.g.dart';

@JsonSerializable()
class UserDeatils{
  @JsonKey(name :'memberId', defaultValue: 0)
  final int memberId;
  @JsonKey(name :'fullName', defaultValue: "")
  final String fullName;
  @JsonKey(name :'dob', defaultValue: "")
  final String dob;

  @JsonKey(name :'contactNo', defaultValue: "")
  final String contactNo;

  @JsonKey(name :'email', defaultValue: "")
  final String email;

  @JsonKey(name :'state', defaultValue: "")
  final String state;

  @JsonKey(name :'city', defaultValue: "")
  final String city;

  @JsonKey(name :'pincode', defaultValue: "")
  final String pincode;

  @JsonKey(name :'fullAddress', defaultValue: "")
  final String fullAddress;

  @JsonKey(name :'accountStatus', defaultValue: "")
  final String accountStatus;

  @JsonKey(name :'country', defaultValue: "")
  final String country;


  UserDeatils({
    required this.memberId,
    required this.fullName,
    required this.dob,
    required this.contactNo,
    required this.email,
    required this.state,
    required this.city,
    required this.pincode,
    required this.fullAddress,
    required this.accountStatus,
    required this.country,
  });

  factory UserDeatils.fromJson(Map<String, dynamic> json) => _$UserDeatilsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDeatilsToJson(this);

}