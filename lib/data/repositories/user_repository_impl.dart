import 'package:flutter_clean_architecture/data/remote/models/Request/edit_profile_request.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl();

  @override
  Future<List<User>> getListUsers(String key) async {
    List<User> listUsers = users.where((user)=> user.brandName.trim().toLowerCase().contains(key.trim().toLowerCase())).toList();
    return listUsers;
  }

  @override
  Future<bool> changeFollowUser(String userName) async {
    User user = users.firstWhere((user)=> user.brandName
        == userName,);
    user.isFollow = !user.isFollow;
    return user.isFollow;
  }

  @override
  Future<User> getUserById(String id) async {
    return users.firstWhere((user) => user.userId == id);
  }


  static List<User> users = [
    User('1',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Tech Guru", 10000, true),
    User('2',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Health Insights", 1200, false),
    User('4',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Daily News", 100, true),
    User('5',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Sporty Life", 9200, false),
    User('6',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Business Trends", 3400, true),
    User('7',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Travel Vibes", 5600, false),
    User('8',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Science Hub", 800, true),
    User('9',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Fashion Forward", 2300, false),
    User('11',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Gamer Zone", 7800, true),
    User('12',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Movie Buffs", 6500, false),
    User('14',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Crypto Kings", 8900, true),
    User('15',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "AI & Tech", 1500, false),
    User('16',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Photography World", 7200, true),
    User('17',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Eco Warriors", 3900, false),
    User('28',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Startup Growth", 9200, true),
    User('29',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Mindfulness", 4100, false),
    User('34',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Space Explorers", 6300, true),
    User('35',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Music Lovers", 5700, false),
    User('36',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Political Views", 8600, true),
    User('37',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "History Buffs", 2500, false),
  ];

  @override
  Future<bool> editProfile(EditProfileRequest request) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }



}