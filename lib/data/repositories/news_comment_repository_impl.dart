import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/author.dart';
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
              .where('replyToId', isEqualTo: '')
              .where('commentForNewsId', isEqualTo: '1')
              .get();

      final List<NewsComment> comments =
          querySnapshot.docs
              .map((doc) => NewsComment.fromJson(doc.data()))
              .toList();
      logger.d('lấy thành công NewsComment firestore');
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
      ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? authorId = prefs.getString('currentUserId');
    final String? imagePath = prefs.getString('currentImagePath');
    final String? brandName = prefs.getString('currentFullName');
    final Author author = Author(
      authorId ?? '',
      imagePath ?? '',
      brandName ?? '',
      0,
      true,
    );

    final NewsComment newsComment = NewsComment(
      author,
      replyToId,
      content,
      [],
      [],
      commentForNewsId,
    );

    try {
      if (replyToId == '') {
        await _firestore.collection('newsComments').add(newsComment.toJson());
      } else {
        final querySnapshot = await _firestore
            .collection('newsComments')
            .where('commentForNewsId', isEqualTo: commentForNewsId)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          final List<NewsComment> comments = querySnapshot.docs
              .map((doc) => NewsComment.fromJson(doc.data()))
              .toList();
          logger.d(1);
          final String? updated = await _findComment(
              comments, replyToId, newsComment);
          logger.d(updated);



        } else {
          logger.e("Không tìm thấy bình luận nào cho bài viết này.");
          return false;
        }
      }
      return true;
    } catch (e) {
      logger.e('Lỗi comment $e');
      return false;
    }
  }
  Future<String?> _findComment(
      List<NewsComment> comments,
      String replyToId,
      NewsComment newsComment,
      ) async {
    for (final comment in comments) {
      if (comment.id == replyToId) {
        logger.d('Tìm thấy comment: ${comment.id}');

        final querySnapshot = await _firestore
            .collection('newsComments')
            .where('id', isEqualTo: comment.id)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          final docRef = querySnapshot.docs.first.reference;
          return docRef.id;
        } else {
          logger.e('Không tìm thấy comment trong Firestore.');
          return null;
        }
      }
      if (comment.replies.isNotEmpty) {
        final String? foundId = await _findComment(
          comment.replies,
          replyToId,
          newsComment,
        );
        if (foundId != null) {
          return foundId;
        }
      }
    }

    return null;
  }



  final List<NewsComment> sampleComments = [
    NewsComment(
      Author('1', 'assets/avatar1.png', 'Brand A', 1000, true),
      '',
      'Bài viết rất hay!',
      [
        NewsComment(
          Author('2', 'assets/avatar2.png', 'Brand B', 500, false),
          '1',
          'Đồng ý luôn!',
          [
            NewsComment(
              Author('3', 'assets/avatar3.png', 'Brand C', 300, true),
              '1',
              'Mình cũng nghĩ vậy.',
              [
                NewsComment(
                  Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
                  '3',
                  'Có thông tin gì thêm không nhỉ?',
                  [
                    NewsComment(
                      Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
                      '4',
                      'Mình nghĩ có thêm ở phần sau.',
                      [],
                      ['user555'],
                      '1',
                    ),
                  ],
                  ['user444'],
                  '1',
                ),
              ],
              [],
              '1',
            ),
          ],
          ['user222'],
          '1',
        ),
        NewsComment(
          Author('3', 'assets/avatar3.png', 'Brand C', 300, true),
          '1',
          'Mình cũng nghĩ vậy.',
          [
            NewsComment(
              Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
              '3',
              'Có thông tin gì thêm không nhỉ?',
              [
                NewsComment(
                  Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
                  '4',
                  'Mình nghĩ có thêm ở phần sau.',
                  [],
                  ['user555'],
                  '1',
                ),
              ],
              ['user444'],
              '1',
            ),
          ],
          [],
          '1',
        ),
      ],
      ['user123'],
      '1',
    ),
    NewsComment(
      Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
      '',
      'Có thông tin gì thêm không nhỉ?',
      [
        NewsComment(
          Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
          '4',
          'Mình nghĩ có thêm ở phần sau.',
          [],
          ['user555'],
          '1',
        ),
      ],
      ['user444'],
      '1',
    ),
    NewsComment(
      Author('1', 'assets/avatar1.png', 'Brand A', 1000, true),
      '',
      'Bài viết rất hay!',
      [
        NewsComment(
          Author('2', 'assets/avatar2.png', 'Brand B', 500, false),
          '1',
          'Đồng ý luôn!',
          [
            NewsComment(
              Author('3', 'assets/avatar3.png', 'Brand C', 300, true),
              '1',
              'Mình cũng nghĩ vậy.',
              [
                NewsComment(
                  Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
                  '3',
                  'Có thông tin gì thêm không nhỉ?',
                  [
                    NewsComment(
                      Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
                      '4',
                      'Mình nghĩ có thêm ở phần sau.',
                      [],
                      ['user555'],
                      '1',
                    ),
                  ],
                  ['user444'],
                  '1',
                ),
              ],
              [],
              '1',
            ),
          ],
          ['user222'],
          '1',
        ),
        NewsComment(
          Author('3', 'assets/avatar3.png', 'Brand C', 300, true),
          '1',
          'Mình cũng nghĩ vậy.',
          [
            NewsComment(
              Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
              '3',
              'Có thông tin gì thêm không nhỉ?',
              [
                NewsComment(
                  Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
                  '4',
                  'Mình nghĩ có thêm ở phần sau.',
                  [],
                  ['user555'],
                  '1',
                ),
              ],
              ['user444'],
              '1',
            ),
          ],
          [],
          '1',
        ),
      ],
      ['user123'],
      '1',
    ),
    NewsComment(
      Author('4', 'assets/avatar4.png', 'Brand D', 250, false),
      '',
      'Có thông tin gì thêm không nhỉ?',
      [
        NewsComment(
          Author('5', 'assets/avatar5.png', 'Brand E', 80, false),
          '4',
          'Mình nghĩ có thêm ở phần sau.',
          [],
          ['user555'],
          '1',
        ),
      ],
      ['user444'],
      '1',
    ),
  ];
}
