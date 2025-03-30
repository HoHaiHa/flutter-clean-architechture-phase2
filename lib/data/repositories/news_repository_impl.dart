import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/news_repository.dart';
import '../../shared/common/result.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Result<List<News>>> getListNewByTopic({required topic}) async {
    if (topic == 'All')
      return Result.completed(LIST_NEWS);
    else {
      return Result.completed(
        LIST_NEWS.where((news) => news.topic == topic).toList(),
      );
    }
  }

  @override
  Future<Result<List<News>>> searchNewByTopic({required key}) async {
    return Result.completed(
      LIST_NEWS
          .where(
            (news) =>
                news.topic.trim().toLowerCase().contains(key.trim().toLowerCase()) ||
                news.title.trim().toLowerCase().contains(key.trim().toLowerCase()) ||
                news.brandName.trim().toLowerCase().contains(key.trim().toLowerCase()),
          )
          .toList(),
    );
  }

  List<News> LIST_NEWS = [
    // All
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Bussiness',
      title: 'Global News: Breaking Stories from Around the World',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC News',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Bussiness',
      title: 'Technology Advances: What to Expect in 2025',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Bussiness',
      title: 'Economic Growth: Challenges Ahead for the Global Market',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Financial Times',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),

    // Sport
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Sport',
      title: 'Champions League: Top Teams to Watch',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Sports Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Sport',
      title: 'Olympic Games: Athletes Who Made History',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Olympic Channel',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Sport',
      title: 'Formula 1: Latest Race Results and Highlights',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Speedway News',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),

    // Politics
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Politics',
      title: 'Election 2025: Candidates and Key Issues',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Political Daily',
      timePost: DateTime.now().subtract(Duration(hours: 3)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Politics',
      title: 'Global Diplomacy: Nations Unite for Climate Action',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Green World',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Politics',
      title: 'Reforms Ahead: Government Plans New Policies',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'National Voice',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Health',
      title: '5 Bí quyết giữ sức khỏe trong mùa đông',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Health',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Health',
      title: 'Tập luyện thể dục để giảm stress và cải thiện sức khỏe',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Health Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Health',
      title: 'Dinh dưỡng hợp lý giúp cải thiện sức đề kháng',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'NBC Health',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Travel
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Travel',
      title: 'Những điểm đến hấp dẫn nhất mùa hè 2025',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Travel',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Travel',
      title: 'Kinh nghiệm du lịch bụi tại Đông Nam Á',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Traveler Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Travel',
      title: 'Khám phá văn hóa địa phương qua ẩm thực',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Culture Trip',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Science
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Science',
      title: 'Khoa học vũ trụ: Những khám phá mới nhất về hệ Mặt Trời',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Science',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Science',
      title: 'Robot AI đã đạt đến trình độ nhận thức?',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(hours: 8)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Science',
      title: 'Phát minh mới trong công nghệ pin siêu tụ điện',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Science Daily',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Fashion',
      title: 'Xu hướng thời trang Xuân Hè 2025',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Vogue',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Fashion',
      title: 'Cách phối đồ công sở hiện đại và tinh tế',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Elle',
      timePost: DateTime.now().subtract(Duration(hours: 6)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Fashion',
      title: 'Phong cách streetwear thịnh hành trong giới trẻ',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'GQ',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    // All
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Bussiness',
      title: 'Global News: Breaking Stories from Around the World',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC News',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Bussiness',
      title: 'Technology Advances: What to Expect in 2025',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Bussiness',
      title: 'Economic Growth: Challenges Ahead for the Global Market',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Financial Times',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),

    // Sport
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Sport',
      title: 'Champions League: Top Teams to Watch',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Sports Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Sport',
      title: 'Olympic Games: Athletes Who Made History',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Olympic Channel',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Sport',
      title: 'Formula 1: Latest Race Results and Highlights',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Speedway News',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),

    // Politics
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Politics',
      title: 'Election 2025: Candidates and Key Issues',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Political Daily',
      timePost: DateTime.now().subtract(Duration(hours: 3)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Politics',
      title: 'Global Diplomacy: Nations Unite for Climate Action',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Green World',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Politics',
      title: 'Reforms Ahead: Government Plans New Policies',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'National Voice',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Health',
      title: '5 Bí quyết giữ sức khỏe trong mùa đông',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Health',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Health',
      title: 'Tập luyện thể dục để giảm stress và cải thiện sức khỏe',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Health Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Health',
      title: 'Dinh dưỡng hợp lý giúp cải thiện sức đề kháng',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'NBC Health',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Travel
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Travel',
      title: 'Những điểm đến hấp dẫn nhất mùa hè 2025',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Travel',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Travel',
      title: 'Kinh nghiệm du lịch bụi tại Đông Nam Á',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Traveler Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Travel',
      title: 'Khám phá văn hóa địa phương qua ẩm thực',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Culture Trip',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Science
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Science',
      title: 'Khoa học vũ trụ: Những khám phá mới nhất về hệ Mặt Trời',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Science',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Science',
      title: 'Robot AI đã đạt đến trình độ nhận thức?',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(hours: 8)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Science',
      title: 'Phát minh mới trong công nghệ pin siêu tụ điện',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Science Daily',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath:
          'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Fashion',
      title: 'Xu hướng thời trang Xuân Hè 2025',
      brandImagePath:
          'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Vogue',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),
    News(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Fashion',
      title: 'Cách phối đồ công sở hiện đại và tinh tế',
      brandImagePath:
          'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Elle',
      timePost: DateTime.now().subtract(Duration(hours: 6)),
    ),
    News(
      imagePath:
          'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Fashion',
      title: 'Phong cách streetwear thịnh hành trong giới trẻ',
      brandImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'GQ',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];
}
