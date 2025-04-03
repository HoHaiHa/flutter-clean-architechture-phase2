import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/author_repository.dart';

@Injectable(as: AuthorRepository)
class AuthorRepositoryImpl extends AuthorRepository {
  AuthorRepositoryImpl();

  @override
  Future<List<Author>> getListAuthors(String key) async {
    List<Author> listAuthors = authors.where((author)=> author.brandName.trim().toLowerCase().contains(key.trim().toLowerCase())).toList();
    return listAuthors;
  }

  @override
  Future<bool> changeFollowAuthor(String authorName) async {
    Author author = authors.firstWhere((author)=> author.brandName
        == authorName);
    author.isFollow = !author.isFollow;
    return author.isFollow;
  }

  static List<Author> authors = [
    Author('1',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Tech Guru", 10000, true),
    Author('2',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Health Insights", 1200, false),
    Author('4',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Daily News", 100, true),
    Author('5',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Sporty Life", 9200, false),
    Author('6',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Business Trends", 3400, true),
    Author('7',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Travel Vibes", 5600, false),
    Author('8',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Science Hub", 800, true),
    Author('9',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Fashion Forward", 2300, false),
    Author('11',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Gamer Zone", 7800, true),
    Author('12',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Movie Buffs", 6500, false),
    Author('14',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Crypto Kings", 8900, true),
    Author('15',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "AI & Tech", 1500, false),
    Author('16',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Photography World", 7200, true),
    Author('17',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Eco Warriors", 3900, false),
    Author('28',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Startup Growth", 9200, true),
    Author('29',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Mindfulness", 4100, false),
    Author('34',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Space Explorers", 6300, true),
    Author('35',"https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Music Lovers", 5700, false),
    Author('36',"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Political Views", 8600, true),
    Author('37',"https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "History Buffs", 2500, false),
  ];


}