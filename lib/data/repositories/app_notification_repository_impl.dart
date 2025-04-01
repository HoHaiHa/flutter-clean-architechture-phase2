import 'package:injectable/injectable.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/app_notification_repository.dart';
import '../../shared/common/error_entity/business_error_entity.dart';

@Injectable(as: AppNotificationRepository)
class AppNotificationRepositoryImpl extends AppNotificationRepository {
  AppNotificationRepositoryImpl();

  @override
  Future<List<AppNotification>> getAllNotification() async {
    try{
      return _appNotifications;
    }
    catch(e) {
      throw BusinessErrorEntityData(name: 'lỗi khi lấy danh sách thông báo', message: 'lỗi khi lấy danh sách thông báo');
    }
  }

  @override
  Future<bool> changeFollowNotificationUser(String userId) async{
    try{
      final AppNotification appNotification = _appNotifications.firstWhere((notification)=> notification.user.userId == userId);
      appNotification.user.isFollowed = !appNotification.user.isFollowed;
      return true;
    }
    catch(e) {
      throw BusinessErrorEntityData(name: 'lỗi khi thay đổi follow user', message: 'lỗi khi thay đổi follow user');
    }
  }

  static List<AppNotification> _appNotifications = [
    AppNotification(
      '2',
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("15", "User15", true),
      "đã thích bài viết của bạn đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết",
      DateTime(2025, 3, 27, 12, 35),
      "like"
    ),
    AppNotification(
      "3",
      "https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg",
      User("16", "User16", false),
      "đã follow bạn",
      DateTime(2025, 3, 20, 23, 50),
      "follow"// Corrected hour
    ),
    AppNotification(
      "4",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("14", "User14", false),
      "đã chia sẻ bài viết",
      DateTime(2025, 3, 26, 9, 20),
      "share"
    ),
    AppNotification(
      "5",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("15", "User15", true),
      "đã thích bài viết của bạn",
      DateTime(2025, 3, 26, 12, 35),
      "like"
    ),
    AppNotification(
      "7",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Alice", "Alice", true),
      "đã follow bạn",
      DateTime(2025, 3, 25, 7, 55),
      "follow"
    ),
    AppNotification(
      "8",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Bob", "Bob", false),
      "đã thích bài viết của bạn",
      DateTime(2025, 3, 25, 10, 15),
      "like"
    ),
    AppNotification(
      "9",
      "https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg",
      User("Charlie", "Charlie", true),
      "đã follow bạn",
      DateTime(2025, 3, 24, 12, 30),
      "follow"
    ),
    AppNotification(
      "10",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("David", "David", false),
      "đã chia sẻ bài viết của bạn",
      DateTime(2025, 3, 24, 15, 20),
      "share"
    ),
    AppNotification(
      "11",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Eve", "Eve", true),
      "đã gửi tin nhắn cho bạn",
      DateTime(2025, 3, 24, 18, 10),
      "message"
    ),
    AppNotification(
      "12",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Frank", "Frank", false),
      "đã follow bạn",
      DateTime(2024, 5, 6, 8, 10),
      "follow"
    ),
    AppNotification(
      "13",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Grace", "Grace", true),
      "đã mời bạn vào nhóm",
      DateTime(2024, 5, 6, 11, 30),
      "add"
    ),
    AppNotification(
      "14",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Hank", "Hank", false),
      "đã thích ảnh của bạn",
      DateTime(2024, 5, 6, 14, 45),
      "like"
    ),
    AppNotification(
      "15",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Ivy", "Ivy", true),
      "đã follow bạn",
      DateTime(2024, 4, 6, 18, 25),
      "follow"
    ),
    AppNotification(
      "16",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Jack", "Jack", false),
      "đã gửi lời mời kết bạn",
      DateTime(2024, 12, 25, 7, 55),
      "addFriend"
    ),
    AppNotification(
      "17",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Kate", "Kate", true),
      "đã thích bài đăng của bạn",
      DateTime(2024, 12, 25, 10, 20),
      "like"
    ),
    AppNotification(
      "18",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Leo", "Leo", false),
      "đã chia sẻ câu chuyện của bạn",
      DateTime(2024, 12, 25, 13, 50),
      "share"
    ),
    AppNotification(
      "19",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Mia", "Mia", true),
      "đã gửi sticker cho bạn",
      DateTime(2024, 12, 25, 17, 40),
      "message"
    ),
    AppNotification(
      "20",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Nathan", "Nathan", false),
      "đã bình luận trên bài viết của bạn",
      DateTime(2024, 12, 25, 21, 10),
      "comment"
    ),
    AppNotification(
      "21",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Olivia", "Olivia", true),
      "đã thích ảnh đại diện của bạn",
      DateTime(2024, 7, 19, 9, 35),
      "like"
    ),
    AppNotification(
      "22",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Paul", "Paul", false),
      "đã follow bạn",
      DateTime(2024, 7, 19, 11, 15),
      "follow"
    ),
    AppNotification(
      "60",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Quinn", "Quinn", true),
      "đã gửi yêu cầu tham gia nhóm",
      DateTime(2024, 7, 19, 14, 5),
      "message"
    ),
    AppNotification(
      "23",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Ryan", "Ryan", false),
      "đã gửi tin nhắn thoại",
      DateTime(2024, 3, 10, 8, 30),
      "message"
    ),
    AppNotification(
      "24",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("Sophia", "Sophia", true),
      "đã thích story của bạn",
      DateTime(2024, 3, 10, 10, 20),
      "like"
    ),
    AppNotification(
      "25",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("Tom", "Tom", false),
      "đã chia sẻ video của bạn",
      DateTime(2024, 3, 10, 14, 10),
      "share"
    ),
    AppNotification(
      "26",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("User1", "User1", true),
      "đã nhắc đến bạn trong bài viết",
      DateTime(2024, 3, 10, 18, 45),
      "comment"
    ),
    AppNotification(
      "27",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("User2", "User2", false),
      "đã gửi lời mời kết bạn",
      DateTime(2023, 12, 25, 9, 10),
      "addFriend"
    ),
    AppNotification(
      "28",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("User3", "User3", true),
      "đã chia sẻ bài đăng của bạn",
      DateTime(2023, 12, 25, 11, 30),
      "share"
    ),
    AppNotification(
      "29",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("User4", "User4", false),
      "đã gửi tin nhắn thoại",
      DateTime(2023, 12, 25, 14, 50),
      "message"
    ),
    AppNotification(
      "30",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      User("User5", "User5", true),
      "đã thích bài viết của bạn",
      DateTime(2023, 12, 25, 18, 25),
      "like"
    ),
    AppNotification(
      "31",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("User6", "User6", false),
      "đã follow bạn",
      DateTime(2023, 12, 25, 22, 15),
      "follow"
    ),
    AppNotification(
      "32",
      "https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg",
      User("User7", "User7", true),
      "đã gửi sticker",
      DateTime(2023, 6, 18, 7, 40),
      "message"
    ),
    AppNotification(
      "33",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      User("User8", "User8", false),
      "đã nhắc đến bạn trong story",
      DateTime(2023, 6, 18, 10, 50),
      "comment"
    ),
  ];


}