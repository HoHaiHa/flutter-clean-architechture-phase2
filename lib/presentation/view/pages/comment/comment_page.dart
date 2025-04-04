import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/comment/component/comment.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../domain/entities/author.dart';
import '../../../../domain/entities/newsComment.dart';
import '../../../../gen/assets.gen.dart';
import '../../../base/base_page.dart';
import '../../../router/router.dart';
import 'comment_bloc.dart';

@RoutePage()
class CommentPage extends BasePage<CommentBloc, CommentEvent, CommentState> {
  const CommentPage({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  void onInitState(BuildContext context) {
    final newsId = context.routeData.argsAs<CommentRouteArgs>().newsId;
    context.read<CommentBloc>().add(CommentEvent.loadData(newsId));
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
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
                        'news001',
                      ),
                    ],
                    ['user444'],
                    'news001',
                  ),
                ],
                [],
                'news001',
              ),
            ],
            ['user222'],
            'news001',
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
                    'news001',
                  ),
                ],
                ['user444'],
                'news001',
              ),
            ],
            [],
            'news001',
          ),
        ],
        ['user123'],
        'news001',
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
            'news001',
          ),
        ],
        ['user444'],
        'news001',
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
                        'news001',
                      ),
                    ],
                    ['user444'],
                    'news001',
                  ),
                ],
                [],
                'news001',
              ),
            ],
            ['user222'],
            'news001',
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
                    'news001',
                  ),
                ],
                ['user444'],
                'news001',
              ),
            ],
            [],
            'news001',
          ),
        ],
        ['user123'],
        'news001',
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
            'news001',
          ),
        ],
        ['user444'],
        'news001',
      ),
    ];
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: context.pop,
            icon: Assets.icons.backIcon.svg(),
          ),
          title: Text(
            "Comment",
            style: textTheme?.textMedium?.copyWith(
              color: colorSchema?.darkBlack,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlocBuilder<CommentBloc, CommentState>(
                    buildWhen: (preState, state){
                      return preState.listComments != state.listComments;
                    },
                    builder: (context, state) {
                      return ListViewComment(listComments: state.listComments ?? []);
                    },
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              height: 78,
              decoration: BoxDecoration(
                color: colorSchema?.grayscaleWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: AppFormField(
                      decoration: InputDecoration(
                        hintText: 'Type your comment',
                      ),
                      centerVertical: true,
                    ),
                  ),
                  Gap(5),
                  Assets.icons.iconSendComment.svg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
