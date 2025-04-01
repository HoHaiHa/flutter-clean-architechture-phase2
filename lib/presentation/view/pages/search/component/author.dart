import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../search_bloc.dart';

class AuthorList extends StatefulWidget{
  final List<Author> listAuthor;

  AuthorList( this.listAuthor);
  @override
  State<AuthorList> createState() => _AuthorListState();
}

class _AuthorListState extends State<AuthorList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return ListView.builder(
      padding: EdgeInsets.only(top: 16,right: 24,left: 24),
      itemCount: widget.listAuthor.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.5),
              height: 86,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: NetworkImage(widget.listAuthor[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.listAuthor[index].brandName,
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Gap(4),
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.listAuthor[index].followersNumber(),
                          style: textTheme?.textSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),

                        ),
                      ],
                    ),
                  ),
                  Gap(8),
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen:(preStatus, status) {
                      return preStatus.followAuthor != status.followAuthor;
                    },
                    builder: (context, state) {
                      return InkWell(
                        child: widget.listAuthor[index].isFollow ? Assets.icons.following.svg() : Assets.icons.followIcon.svg(),
                        onTap: (){
                          context.read<SearchBloc>().add(SearchEvent.changeFollowAuthor(widget.listAuthor[index].brandName));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Gap(16)
          ],
        );
      },
    );
  }
}
