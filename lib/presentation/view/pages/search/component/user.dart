import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/extension/number.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../search_bloc.dart';

class UserList extends StatefulWidget{
  final List<User> listUser;

  UserList( this.listUser);
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return ListView.builder(
      padding: EdgeInsets.only(right: 24,left: 24),
      itemCount: widget.listUser.length,
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
                        image: NetworkImage(widget.listUser[index].imagePath),
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
                          widget.listUser[index].brandName,
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Gap(4),
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.listUser[index].followers.getFollows(),
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
                      return preStatus.followUser != status.followUser;
                    },
                    builder: (context, state) {
                      return InkWell(
                        child: widget.listUser[index].isFollow ? Assets.icons.following.svg() : Assets.icons.followIcon.svg(),
                        onTap: (){
                          context.read<SearchBloc>().add(SearchEvent.changeFollowUser(widget.listUser[index].brandName));
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
