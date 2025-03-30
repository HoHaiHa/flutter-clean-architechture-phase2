import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author{
  final String imagePath;
  final String brandName;
  final int  followers;
  bool isFollow;

  Author(this.imagePath, this.brandName, this.followers, this.isFollow);

  String followersNumber (){
    double followersDouble = followers/1000;
    if(followers < 1000)
      return '${followers} Followers';
    else
      return '${followersDouble}k Followers';
  }
}
