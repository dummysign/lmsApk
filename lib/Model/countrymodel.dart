
import 'package:json_annotation/json_annotation.dart';
part 'countrymodel.g.dart';



@JsonSerializable()
class countrymodel{
  @JsonKey(name :'countryId', defaultValue: 0)
  final int CountryId;

  @JsonKey(name :'responseCode', defaultValue: 0)
  final int responseCode;

  @JsonKey(name :'responseMessage', defaultValue: '')
  final String responseMessage;

  @JsonKey(name :'countryName', defaultValue: '')
  final String CountryName;


  @JsonKey(name :'countryCode', defaultValue: '')
  final String CountryCode;


  countrymodel({
    required this.CountryId ,
    required this.responseCode ,
    required this.responseMessage  ,
    required this.CountryName  ,
    required this.CountryCode
  });


  factory countrymodel.fromJson(Map<String, dynamic> json) =>
      _$countrymodelFromJson(json);
  Map<String, dynamic> toJson() => _$countrymodelToJson(this);

}