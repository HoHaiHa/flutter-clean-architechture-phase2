import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  final String userId;
  final String imagePath;
  final String brandName;
  final int  followers;
  bool isFollow;

  User( this.userId,this.imagePath, this.brandName, this.followers, this.isFollow);


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
