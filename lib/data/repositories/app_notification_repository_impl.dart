import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/app_notification.dart';
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
  Future<bool> changeFollowNotificationUser(String authorId) async{
    try{
      final AppNotification appNotification = _appNotifications.firstWhere((notification)=> notification.author.authorId == authorId);
      appNotification.author.isFollow = !appNotification.author.isFollow;
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
      Author("15",'', ",'User15",0, true,),
      "đã thích bài viết của bạn đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết đã chia sẻ bài viết",
      DateTime(2025, 3, 27, 12, 35),
      "like"
    ),
    AppNotification(
      "3",
      "https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg",
      Author("16",'', "Author16",0, false),
      "đã follow bạn",
      DateTime(2025, 3, 20, 23, 50),
      "follow"// Corrected hour
    ),
    AppNotification(
      "4",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      Author("14",'', "Author14",0, false),
      "đã chia sẻ bài viết",
      DateTime(2025, 3, 26, 9, 20),
      "share"
    ),
    AppNotification(
      "5",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      Author("15",'', "Author15",0, true),
      "đã thích bài viết của bạn",
      DateTime(2025, 3, 26, 12, 35),
      "like"
    ),
    AppNotification(
      "7",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      Author("Alice",'', "Alice",0, true),
      "đã follow bạn",
      DateTime(2025, 3, 25, 7, 55),
      "follow"
    ),
    AppNotification(
      "8",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      Author("Bob",'', "Bob",0, false),
      "đã thích bài viết của bạn",
      DateTime(2025, 3, 25, 10, 15),
      "like"
    ),
    AppNotification(
      "9",
      "https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg",
      Author("Charlie",'', "Charlie",0, true),
      "đã follow bạn",
      DateTime(2025, 3, 24, 12, 30),
      "follow"
    ),
    AppNotification(
      "10",
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      Author("David",'', "David",0, false),
      "đã chia sẻ bài viết của bạn",
      DateTime(2025, 3, 24, 15, 20),
      "share"
    ),
    AppNotification(
      "11",
      "https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg",
      Author("Eve",'', "Eve",0, true),
      "đã gửi tin nhắn cho bạn",
      DateTime(2025, 3, 24, 18, 10),
      "message"
    ),

  ];


}