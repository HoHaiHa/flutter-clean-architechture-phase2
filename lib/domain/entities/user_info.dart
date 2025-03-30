import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
 class UserInfo  {
    final int id;
    final String fullName;

    UserInfo(this.id, this.fullName);
}
