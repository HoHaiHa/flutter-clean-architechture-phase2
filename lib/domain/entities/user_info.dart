import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
 class UserInfo  {
    UserInfo(this.id, this.fullName);

    final int id;
    final String fullName;
}
