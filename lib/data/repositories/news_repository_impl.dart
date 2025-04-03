import 'dart:math';
import 'package:flutter_clean_architecture/data/repositories/author_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/author.dart';
import '../../domain/repositories/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {

  @override
  Future<List<News>> getListNewByTopic({topic}) async {
    if (topic == '')

      return _listNews;
    else {
      return _listNews.where((news) => news.topic == topic).toList();
    }
  }

  @override
  Future<List<News>> searchNewByTopic({required key}) async {
    List<News> searchResult = _listNews
        .where(
          (news) =>
      news.topic.trim().toLowerCase().contains(
        key.trim().toLowerCase(),
      ) ||
          news.title.trim().toLowerCase().contains(
            key.trim().toLowerCase(),
          ) ,
    )
        .toList();
    //if(searchResult.isEmpty) throw BusinessErrorEntityData(name: 'danh sách rỗng', message: 'danh sách rỗng');
    return searchResult;
  }

  @override
  Future<News> getNewsById(String newsId) async {
    return _listNews.firstWhere((news)=> news.id == newsId);
  }

  static Author getRandomAuthor() {
    Random random = Random();
    List<Author> _authors= AuthorRepositoryImpl.authors;
    return _authors[random.nextInt(_authors.length)];
  }

  @override
  Future<bool> checkLikeForCurrentUser(String newsId) async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      News news = _listNews.firstWhere((news)=> news.id == newsId);
      String? currentUserId = prefs.getString('currentUserId');
      return news.userLikeId.any((id)=> id == currentUserId);
    }
    catch(e){
      logger.d('lỗi khi check like');
      throw BusinessErrorEntityData(name: 'lỗi khi check like', message: 'lỗi khi check like');
    }

  }

  @override
  Future<bool> changeLikeForCurrentUser(String newsId) async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      News news = _listNews.firstWhere((news)=> news.id == newsId);
      String? currentUserId = prefs.getString('currentUserId');
      String? userIdLiked = news.userLikeId.firstWhere((userId)=> userId == currentUserId,orElse: () => '');
      if(userIdLiked != ''){
        news.userLikeId.remove(userIdLiked);
        return false;
      }
      else{
        news.userLikeId.add(currentUserId ?? '');
        return true;
      }
    }
    catch(e){
      throw BusinessErrorEntityData(name: 'có lỗi trong lúc thay đổi like', message: 'có lỗi trong lúc thay đổi like');
    }
  }

  static String content = "Ẩm thực Việt Nam là một bức tranh đa sắc màu, phản ánh rõ nét văn hóa và lịch sử lâu đời của đất nước. Mỗi vùng miền đều có những món ăn đặc trưng, mang hương vị và cách chế biến riêng biệt, tạo nên một bản đồ ẩm thực phong phú và hấp dẫn. Hãy dành thời gian "
      "khám phá và thưởng thức những món ăn đặc trưng của từng vùng miền để cảm nhận trọn vẹn vẻ đẹp văn hóa Việt Nam.\n\nẨm thực Việt Nam là một bức tranh đa sắc màu, phản ánh rõ nét văn hóa và lịch sử lâu đời của đất nước. Mỗi vùng miền đều có những món ăn đặc trưng, mang hương vị và "
      "cách chế biến riêng biệt, tạo nên một bản đồ ẩm thực phong phú và hấp dẫn. Hãy dành thời gian khám phá và thưởng thức những món ăn đặc trưng của từng vùng miền để cảm nhận trọn vẹn vẻ đẹp văn hóa Việt Nam.";

  static List<News> _listNews = [
    // All
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Bussiness',
      title: 'Global News: Breaking Stories from Around the World',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(hours: 2)),
      content: content, id: '1', userLikeId: ['1','2','3','4'],
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Bussiness',
      title: 'Technology Advances: What to Expect in 2025',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 1)),
      content: content, id: '2', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Bussiness',
      title: 'Economic Growth: Challenges Ahead for the Global Market',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 3)), id: '3', userLikeId: ['1','2','3','4'],
    ),

    // Sport
    News(
      content: content,
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Sport',
      title: 'Champions League: Top Teams to Watch',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(hours: 5)), id: '4', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Sport',
      title: 'Olympic Games: Athletes Who Made History',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 2)), id: '5', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Sport',
      title: 'Formula 1: Latest Race Results and Highlights',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 4)), id: '6', userLikeId: ['1','2','3','4'],
    ),

    // Politics
    News(
      content: content,
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Politics',
      title: 'Election 2025: Candidates and Key Issues',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(hours: 3)), id: '7', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Politics',
      title: 'Global Diplomacy: Nations Unite for Climate Action',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 1)), id: '8', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Politics',
      title: 'Reforms Ahead: Government Plans New Policies',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 5)), id: '9', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Health',
      title: '5 Bí quyết giữ sức khỏe trong mùa đông',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(hours: 2)), id: '10', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Health',
      title: 'Tập luyện thể dục để giảm stress và cải thiện sức khỏe',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 1)), id: '10', userLikeId: ['1','2','3','4'],
    ),
    News(
      content: content,
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Health',
      title: 'Dinh dưỡng hợp lý giúp cải thiện sức đề kháng',
      author: getRandomAuthor(),
      timePost: DateTime.now().subtract(Duration(days: 3)), id: '11', userLikeId: ['1','2','3','4'],
    ),

  ];


}
