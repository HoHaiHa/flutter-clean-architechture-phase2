import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture/domain/entities/newsComment.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/author.dart';
import '../../domain/repositories/news_comment_repository.dart';
import '../../shared/utils/logger.dart';

@Injectable(as: NewsCommentRepository)
class NewsCommentRepositoryImpl extends NewsCommentRepository {
  NewsCommentRepositoryImpl();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Future<List<NewsComment>> getCommentByNewsId(String newsId) async {
    try{
      // sampleComments.forEach((NewsComment){
      //   _firestore.collection('newsComment').add(NewsComment.toJson());
      // });

      final querySnapshot = await _firestore
          .collection('newsComments')
          .where('replyToId', isEqualTo: '')
          .where('commentForNewsId', isEqualTo: '1')
          .get();

      final List<NewsComment> comments = querySnapshot.docs
          .map((doc) => NewsComment.fromJson(doc.data()))
          .toList();
      logger.d('Lưu thành công NewsComment firestore');
      return comments;
    }
    catch(e){
      logger.d('có lỗi khi lấy dữ liệu NewsComment firestore ${e}');
      throw BusinessErrorEntityData(name: 'có lỗi khi lấy dữ liệu firestore', message: 'có lỗi khi lấy dữ liệu firestore');
    }
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
          [NewsComment(
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
          ),],
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
          [NewsComment(
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
          ),],
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