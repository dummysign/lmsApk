
import 'package:json_annotation/json_annotation.dart';
part 'StateModel.g.dart';

@JsonSerializable()
class  StateModel {
  @JsonKey(name :'stateId', defaultValue: 0)
  final int stateId;

  @JsonKey(name :'stateName', defaultValue: '')
  final String stateName;

  StateModel({
    required this.stateId ,
    required this.stateName
  });


  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);
  Map<String, dynamic> toJson() => _$StateModelToJson(this);


}