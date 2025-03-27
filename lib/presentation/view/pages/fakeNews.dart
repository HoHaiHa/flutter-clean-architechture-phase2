

import '../../../domain/entities/author.dart';
import '../../../domain/entities/news.dart';
import '../../../domain/entities/app_notification.dart';
import '../../../domain/entities/topic.dart';

class FakeApi{
  static final List<String> TOPIC_VITUAL = ["All",'Sport','Politics','Bussiness','Health','Travel','Science','Fashion'];

  static final List<Author> authors = [
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


  static final List<Topic> topics = [
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "All",
      "Chủ đề này bao quát tất cả các thể loại tin tức, giúp bạn cập nhật những tin nóng hổi nhất trên thế giới.",
      true,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Sport",
      "Tin tức thể thao cập nhật các giải đấu lớn, thành tích của các vận động viên và những sự kiện quan trọng.",
      true,
    ),
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Politics",
      "Chủ đề chính trị cung cấp thông tin về các chính sách, quan hệ quốc tế và tình hình chính trị toàn cầu.",
      false,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Business",
      "Cập nhật tin tức kinh tế, xu hướng thị trường và các cơ hội đầu tư hấp dẫn trên thế giới.",
      true,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Health",
      "Tin tức y tế và sức khỏe, bao gồm các nghiên cứu mới, mẹo chăm sóc bản thân và dịch bệnh toàn cầu.",
      true,
    ),
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Travel",
      "Khám phá các địa điểm du lịch mới, kinh nghiệm du lịch và xu hướng di chuyển mới nhất.",
      false,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Science",
      "Cập nhật những tiến bộ khoa học mới nhất, khám phá vũ trụ và các nghiên cứu tiên tiến.",
      true,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Fashion",
      "Tin tức thời trang với các xu hướng mới nhất, phong cách thiết kế và sự kiện thời trang nổi bật.",
      false,
    ),
    // Các topic khác (isSaved = false)
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Technology",
      "Tin tức công nghệ về AI, blockchain, smartphone và các phát minh kỹ thuật số hiện đại.",
      false,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Entertainment",
      "Tin tức giải trí bao gồm phim ảnh, âm nhạc, người nổi tiếng và các sự kiện văn hóa.",
      false,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Food",
      "Khám phá ẩm thực, các công thức nấu ăn và xu hướng ẩm thực trên thế giới.",
      false,
    ),
  ];


  static final List<AppNotification> NOTIFICATIONS = [

    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User14", false, "đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết", DateTime(2025, 3, 27, 9, 20)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User15", true, "đã thích bài viết của bạn đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết", DateTime(2025, 3, 27, 12, 35)),
    AppNotification("https://png.pngtree.com/png-vector/20200917/ourmid/pngtree-realistic-breaking-news-label-designs-png-image_2347387.jpg", "User16", false, "đã theo dõi bạn", DateTime(2025, 3, 20, 27, 50)),

    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User14", false, "đã chia sẻ bài viết", DateTime(2025, 3, 26, 9, 20)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User15", true, "đã thích bài viết của bạn", DateTime(2025, 3, 26, 12, 35)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User16", false, "đã theo dõi bạn", DateTime(2025, 3, 20, 26, 50)),
    // Ngày 2025-08-24 (5 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Alice", true, "đã theo dõi bạn", DateTime(2025, 3, 25, 7, 55)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Bob", false, "đã thích bài viết của bạn", DateTime(2025, 3, 25, 10, 15)),
    AppNotification("https://png.pngtree.com/png-vector/20200917/ourmid/pngtree-realistic-breaking-news-label-designs-png-image_2347387.jpg", "Charlie", true, "đã bình luận: 'Quá đẹp!'", DateTime(2025, 3, 24, 12, 30)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "David", false, "đã chia sẻ bài viết của bạn", DateTime(2025, 3, 24, 15, 20)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Eve", true, "đã gửi tin nhắn cho bạn", DateTime(2025, 3, 24, 18, 10)),

    // Ngày 2025-05-06 (4 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Frank", false, "đã đề cập bạn trong bình luận", DateTime(2024, 5, 6, 8, 10)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Grace", true, "đã mời bạn vào nhóm", DateTime(2024, 5, 6, 11, 30)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Hank", false, "đã thích ảnh của bạn", DateTime(2024, 5, 6, 14, 45)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Ivy", true, "đã theo dõi bạn", DateTime(2024, 4, 6, 18, 25)),

    // Ngày 2024-12-25 (5 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Jack", false, "đã gửi lời mời kết bạn", DateTime(2024, 12, 25, 7, 55)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Kate", true, "đã thích bài đăng của bạn", DateTime(2024, 12, 25, 10, 20)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Leo", false, "đã chia sẻ câu chuyện của bạn", DateTime(2024, 12, 25, 13, 50)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Mia", true, "đã gửi sticker cho bạn", DateTime(2024, 12, 25, 17, 40)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Nathan", false, "đã bình luận trên bài viết của bạn", DateTime(2024, 12, 25, 21, 10)),

    // Ngày 2024-07-19 (3 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Olivia", true, "đã thích ảnh đại diện của bạn", DateTime(2024, 7, 19, 9, 35)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Paul", false, "đã theo dõi bạn", DateTime(2024, 7, 19, 11, 15)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Quinn", true, "đã gửi yêu cầu tham gia nhóm", DateTime(2024, 7, 19, 14, 5)),

    // Ngày 2024-03-10 (4 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Ryan", false, "đã gửi tin nhắn thoại", DateTime(2024, 3, 10, 8, 30)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "Sophia", true, "đã thích story của bạn", DateTime(2024, 3, 10, 10, 20)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "Tom", false, "đã chia sẻ video của bạn", DateTime(2024, 3, 10, 14, 10)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User1", true, "đã nhắc đến bạn trong bài viết", DateTime(2024, 3, 10, 18, 45)),

    // Ngày 2023-12-25 (5 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User2", false, "đã gửi lời mời kết bạn", DateTime(2023, 12, 25, 9, 10)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User3", true, "đã chia sẻ bài đăng của bạn", DateTime(2023, 12, 25, 11, 30)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User4", false, "đã gửi tin nhắn thoại", DateTime(2023, 12, 25, 14, 50)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User5", true, "đã thích bài viết của bạn", DateTime(2023, 12, 25, 18, 25)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User6", false, "đã theo dõi bạn", DateTime(2023, 12, 25, 22, 15)),

    // Ngày 2023-06-18 (4 thông báo)
    AppNotification("https://png.pngtree.com/png-vector/20200917/ourmid/pngtree-realistic-breaking-news-label-designs-png-image_2347387.jpg", "User7", true, "đã gửi sticker", DateTime(2023, 6, 18, 7, 40)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User8", false, "đã nhắc đến bạn trong story", DateTime(2023, 6, 18, 10, 50)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User9", true, "đã thích ảnh của bạn", DateTime(2023, 6, 18, 15, 30)),
    AppNotification("https://png.pngtree.com/png-vector/20200917/ourmid/pngtree-realistic-breaking-news-label-designs-png-image_2347387.jpg", "User10", false, "đã bình luận trên bài đăng", DateTime(2023, 6, 18, 19, 40)),

    // Ngày 2022-11-05 (3 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User11", true, "đã gửi yêu cầu kết bạn", DateTime(2022, 11, 5, 8, 10)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User12", false, "đã thêm bạn vào nhóm", DateTime(2022, 11, 5, 13, 30)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User13", true, "đã gửi tin nhắn", DateTime(2022, 11, 5, 18, 45)),

    // Ngày 2022-03-20 (3 thông báo)
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User14", false, "đã chia sẻ bài viết", DateTime(2022, 3, 20, 9, 20)),
    AppNotification("https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg", "User15", true, "đã thích bài viết của bạn", DateTime(2022, 3, 20, 12, 35)),
    AppNotification("https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870", "User16", false, "đã theo dõi bạn", DateTime(2022, 3, 20, 15, 50)),
  ];


  static final List<News> LIST_NEWS = [
    // All
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Bussiness',
      title: 'Global News: Breaking Stories from Around the World',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC News',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Bussiness',
      title: 'Technology Advances: What to Expect in 2025',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Bussiness',
      title: 'Economic Growth: Challenges Ahead for the Global Market',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Financial Times',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),

    // Sport
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Sport',
      title: 'Champions League: Top Teams to Watch',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Sports Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Sport',
      title: 'Olympic Games: Athletes Who Made History',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Olympic Channel',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Sport',
      title: 'Formula 1: Latest Race Results and Highlights',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Speedway News',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),

    // Politics
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Politics',
      title: 'Election 2025: Candidates and Key Issues',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Political Daily',
      timePost: DateTime.now().subtract(Duration(hours: 3)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Politics',
      title: 'Global Diplomacy: Nations Unite for Climate Action',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Green World',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Politics',
      title: 'Reforms Ahead: Government Plans New Policies',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'National Voice',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Health',
      title: '5 Bí quyết giữ sức khỏe trong mùa đông',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Health',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Health',
      title: 'Tập luyện thể dục để giảm stress và cải thiện sức khỏe',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Health Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Health',
      title: 'Dinh dưỡng hợp lý giúp cải thiện sức đề kháng',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'NBC Health',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Travel
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Travel',
      title: 'Những điểm đến hấp dẫn nhất mùa hè 2025',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Travel',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Travel',
      title: 'Kinh nghiệm du lịch bụi tại Đông Nam Á',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Traveler Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Travel',
      title: 'Khám phá văn hóa địa phương qua ẩm thực',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Culture Trip',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Science
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Science',
      title: 'Khoa học vũ trụ: Những khám phá mới nhất về hệ Mặt Trời',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Science',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Science',
      title: 'Robot AI đã đạt đến trình độ nhận thức?',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(hours: 8)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Science',
      title: 'Phát minh mới trong công nghệ pin siêu tụ điện',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Science Daily',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Fashion',
      title: 'Xu hướng thời trang Xuân Hè 2025',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Vogue',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Fashion',
      title: 'Cách phối đồ công sở hiện đại và tinh tế',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Elle',
      timePost: DateTime.now().subtract(Duration(hours: 6)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Fashion',
      title: 'Phong cách streetwear thịnh hành trong giới trẻ',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'GQ',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    // All
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Bussiness',
      title: 'Global News: Breaking Stories from Around the World',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC News',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Bussiness',
      title: 'Technology Advances: What to Expect in 2025',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Bussiness',
      title: 'Economic Growth: Challenges Ahead for the Global Market',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Financial Times',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),

    // Sport
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Sport',
      title: 'Champions League: Top Teams to Watch',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Sports Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Sport',
      title: 'Olympic Games: Athletes Who Made History',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Olympic Channel',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Sport',
      title: 'Formula 1: Latest Race Results and Highlights',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Speedway News',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),

    // Politics
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Politics',
      title: 'Election 2025: Candidates and Key Issues',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Political Daily',
      timePost: DateTime.now().subtract(Duration(hours: 3)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Politics',
      title: 'Global Diplomacy: Nations Unite for Climate Action',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Green World',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Politics',
      title: 'Reforms Ahead: Government Plans New Policies',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'National Voice',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Health',
      title: '5 Bí quyết giữ sức khỏe trong mùa đông',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Health',
      timePost: DateTime.now().subtract(Duration(hours: 2)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Health',
      title: 'Tập luyện thể dục để giảm stress và cải thiện sức khỏe',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Health Today',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Health',
      title: 'Dinh dưỡng hợp lý giúp cải thiện sức đề kháng',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'NBC Health',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Travel
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Travel',
      title: 'Những điểm đến hấp dẫn nhất mùa hè 2025',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Travel',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Travel',
      title: 'Kinh nghiệm du lịch bụi tại Đông Nam Á',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Traveler Hub',
      timePost: DateTime.now().subtract(Duration(hours: 5)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Travel',
      title: 'Khám phá văn hóa địa phương qua ẩm thực',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Culture Trip',
      timePost: DateTime.now().subtract(Duration(days: 3)),
    ),
    // Science
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Science',
      title: 'Khoa học vũ trụ: Những khám phá mới nhất về hệ Mặt Trời',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'BBC Science',
      timePost: DateTime.now().subtract(Duration(days: 2)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Science',
      title: 'Robot AI đã đạt đến trình độ nhận thức?',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Tech Today',
      timePost: DateTime.now().subtract(Duration(hours: 8)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Science',
      title: 'Phát minh mới trong công nghệ pin siêu tụ điện',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'Science Daily',
      timePost: DateTime.now().subtract(Duration(days: 5)),
    ),
    News(
      imagePath: 'https://static01.nyt.com/images/2023/06/09/multimedia/09HL-01-qhmp/09HL-01-qhmp-superJumbo-v4.jpg',
      topic: 'Fashion',
      title: 'Xu hướng thời trang Xuân Hè 2025',
      brandImagePath: 'https://upload.wikimedia.org/wikipedia/vi/thumb/2/24/BBC_News_HD_Logo.svg/2560px-BBC_News_HD_Logo.svg.png',
      brandName: 'Vogue',
      timePost: DateTime.now().subtract(Duration(days: 4)),
    ),
    News(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUFQmS0nNLbs7btl0hgMW1EwnxUu823faig&s',
      topic: 'Fashion',
      title: 'Cách phối đồ công sở hiện đại và tinh tế',
      brandImagePath: 'https://webb.com.vn/wp-content/uploads/2023/03/Mau-logo-Lettermark2.jpg',
      brandName: 'Elle',
      timePost: DateTime.now().subtract(Duration(hours: 6)),
    ),
    News(
      imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-01/anchor-group-shot-te-250113-96cd90.jpg',
      topic: 'Fashion',
      title: 'Phong cách streetwear thịnh hành trong giới trẻ',
      brandImagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkntUo5YzZ-R-eD5KLiu6JWjlQ9rsXyiipZQ&s',
      brandName: 'GQ',
      timePost: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

}

