import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/shared/common/result.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/author_repository.dart';

@Injectable(as: AuthorRepository)
class AuthorRepositoryImpl extends AuthorRepository {
  AuthorRepositoryImpl();

  @override
  Future<List<Author>> getListAuthors(String key) async {
    List<Author> listAuthors = _authors.where((author)=> author.brandName.trim().toLowerCase().contains(key.trim().toLowerCase())).toList();
    //if(listAuthors.isEmpty)  throw BusinessErrorEntityData(name: 'danh sách rỗng', message: 'danh sách rỗng');
    return listAuthors;
  }

  @override
  Future<Result<List<Author>>> changeFollowAuthor(String authorName) async {
    Author author = _authors.firstWhere((author)=> author.brandName
        == authorName);
    author.isFollow = !author.isFollow;
    return Result.completed(_authors);
  }

  static List<Author> _authors = [
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Tech Guru", 10000, true),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Health Insights", 1200, false),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Daily News", 100, true),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Sporty Life", 9200, false),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Business Trends", 3400, true),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Travel Vibes", 5600, false),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Science Hub", 800, true),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Fashion Forward", 2300, false),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Gamer Zone", 7800, true),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Movie Buffs", 6500, false),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Crypto Kings", 8900, true),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "AI & Tech", 1500, false),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Photography World", 7200, true),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Eco Warriors", 3900, false),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Startup Growth", 9200, true),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Mindfulness", 4100, false),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "Space Explorers", 6300, true),
    Author("https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg", "Music Lovers", 5700, false),
    Author("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s", "Political Views", 8600, true),
    Author("https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw", "History Buffs", 2500, false),
  ];


}