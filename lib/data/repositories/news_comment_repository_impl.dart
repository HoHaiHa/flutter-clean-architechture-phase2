import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/news_comment_repository.dart';
import '../../shared/utils/logger.dart';

@Injectable(as: NewsCommentRepository)
class NewsCommentRepositoryImpl extends NewsCommentRepository {
  NewsCommentRepositoryImpl();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<NewsComment>> getCommentByNewsId(String newsId) async {
    try {
      // for (final comment in sampleComments) {
      //   await _firestore.collection('newsComments').add(comment.toJson());
      // }
      final querySnapshot =
          await _firestore
              .collection('newsComments')
              .where('replyToCommentId', isEqualTo: '')
              .where('commentForNewsId', isEqualTo: newsId)
              .get();

      final List<NewsComment> comments =
          querySnapshot.docs
              .map((doc) => NewsComment.fromJson(doc.data()))
              .toList();
      logger.d('lấy thành công NewsComment firestore $comments---$newsId fds');
      return comments;
    } catch (e) {
      logger.d('Có lỗi khi lấy dữ liệu NewsComment firestore: $e');
      throw BusinessErrorEntityData(
        name: 'Có lỗi khi lấy dữ liệu firestore',
        message: 'Có lỗi khi lấy dữ liệu firestore',
      );
    }
  }

  @override
  Future<bool> sendComment(
    String replyToId,
    String content,
    String commentForNewsId,
    String replyToUsername,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('currentUserId');
    final String? imagePath = prefs.getString('currentImagePath');
    final String? brandName = prefs.getString('currentFullName');
    final User user = User(
      userId ?? '',
      imagePath ?? '',
      brandName ?? '',
      0,
      true,
    );

    final NewsComment newsComment = NewsComment(
      user,
      replyToId,
      content,
      replyToUsername,
      [],
      [],
      commentForNewsId,
    );

    try {
      if (replyToId.trim().isEmpty) {
        await _firestore.collection('newsComments').add(newsComment.toJson());
        print('Đã thêm comment top-level');
      } else {
        bool result = await _findAndChangeComment(newsComment, replyToId);
        if (!result) {
          print('Không tìm thấy comment có id $replyToId để thêm reply');
        }
      }
      return true;
    } catch (e) {
      logger.e('Lỗi comment $e');
      return false;
    }
  }

  Future<bool> _findAndChangeComment(
    NewsComment newComment,
    String replyToId,
  ) async {
    final commentsCollection = _firestore.collection('newsComments');

    final QuerySnapshot topLevelSnapshot =
        await commentsCollection
            .where('id', isEqualTo: replyToId)
            .limit(1)
            .get();

    if (topLevelSnapshot.docs.isNotEmpty) {
      final docRef = topLevelSnapshot.docs.first.reference;
      await docRef.update({
        'replies': FieldValue.arrayUnion([newComment.toJson()]),
      });
      print('Đã thêm reply vào comment top-level');
      return true;
    } else {
      final QuerySnapshot allDocs = await commentsCollection.get();
      for (var doc in allDocs.docs) {
        final data = doc.data() as Map<String, dynamic>;
        List<dynamic> replies = data['replies'] ?? [];
        if (_updateNestedReplies(replies, newComment.toJson(), replyToId)) {
          await doc.reference.update({'replies': replies});
          print('Đã thêm reply vào comment nested');
          return true;
        }
      }
    }
    return false;
  }

  bool _updateNestedReplies(
    List<dynamic> repliesList,
    Map<String, dynamic> newReply,
    String replyToId,
  ) {
    for (var reply in repliesList) {
      if (reply is Map<String, dynamic>) {
        if (reply['id'] == replyToId) {
          if (reply.containsKey('replies')) {
            (reply['replies'] as List).add(newReply);
          } else {
            reply['replies'] = [newReply];
          }
          return true;
        }
        if (reply.containsKey('replies')) {
          final bool found = _updateNestedReplies(
            reply['replies'] as List,
            newReply,
            replyToId,
          );
          if (found) return true;
        }
      }
    }
    return false;
  }

  @override
  Future<bool> changeLikeComment(String commentId) async {
    final commentsCollection = _firestore.collection('newsComments');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('currentUserId');
    final QuerySnapshot topLevelSnapshot =
    await commentsCollection.where('id', isEqualTo: commentId).limit(1).get();
    if (topLevelSnapshot.docs.isNotEmpty) {
      final docRef = topLevelSnapshot.docs.first.reference;
      final data = topLevelSnapshot.docs.first.data() as Map<String, dynamic>;
      List<dynamic> userLikeIds = data['userLikeId'] ?? [];

      if (userLikeIds.contains(userId)) {
        userLikeIds.remove(userId);
      } else {
        userLikeIds.add(userId);
      }
      await docRef.update({'userLikeId': userLikeIds});
      print('Đã cập nhật like cho comment ');
      return true;
    } else {
      final QuerySnapshot allDocs = await commentsCollection.get();
      for (var doc in allDocs.docs) {
        final data = doc.data() as Map<String, dynamic>;
        List<dynamic> replies = data['replies'] ?? [];

        bool updated = _updateNestedLike(replies, commentId, userId ??'');
        if (updated) {
          await doc.reference.update({'replies': replies});
          print('Đã cập nhật like cho comment nested');
          return true;
        }
      }
    }
    print('Không tìm thấy comment để like/unlike');
    return false;
  }

  bool _updateNestedLike(
      List<dynamic> repliesList,
      String commentId,
      String userId,
      ) {
    for (var reply in repliesList) {
      if (reply is Map<String, dynamic>) {
        if (reply['id'] == commentId) {
          List<dynamic> userLikeIds = reply['userLikeId'] ?? [];
          if (userLikeIds.contains(userId)) {
            userLikeIds.remove(userId);
          } else {
            userLikeIds.add(userId);
          }
          reply['userLikeId'] = userLikeIds;
          return true;
        }
        if (reply.containsKey('replies')) {
          final bool found = _updateNestedLike(
            reply['replies'] as List,
            commentId,
            userId,
          );
          if (found) return true;
        }
      }
    }
    return false;
  }

  @override
  Future<int> countAllCommentByNewsId(String newsId) async {
    int count = 0;
    final snapshot = await _firestore
        .collection('newsComments')
        .where('commentForNewsId', isEqualTo: newsId)
        .get();
    for (var doc in snapshot.docs) {
      final data = doc.data();
      count++;
      count += _countReplies(data['replies']);
    }

    return count;
  }

  int _countReplies(dynamic replies) {
    if (replies == null || replies is! List) return 0;
    int count = 0;
    for (var reply in replies) {
      if (reply is Map<String, dynamic>) {
        count++;
        count += _countReplies(reply['replies']);
      }
    }
    return count;
  }



}
