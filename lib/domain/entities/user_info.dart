import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
 class UserInfo  {
    UserInfo(this.id, this.fullName, this.imagePath, this.username, this.email, this.phoneNumber, this.bio, this.website);

    final String id;
    final String? imagePath;
    final String? fullName;
    final String username;
    final String email;
    final String phoneNumber;
    final String? bio;
    final String? website;

    factory UserInfo.fromJson(Map<String, dynamic> json) =>
        _$UserInfoFromJson(json);

    Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
