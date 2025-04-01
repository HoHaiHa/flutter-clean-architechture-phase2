import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/search_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';

class TopicList extends StatefulWidget {
  final List<Topic> listTopic;

  TopicList(this.listTopic);

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return ListView.builder(
      padding: EdgeInsets.only(top: 16,right: 24,left: 24),
      itemCount: widget.listTopic.length,
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
                        image: NetworkImage(widget.listTopic[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.listTopic[index].topicName,
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Text(
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          widget.listTopic[index].description,
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
                      return preStatus.saveTopic != status.saveTopic;
                    },
                    builder: (context, state) {
                      return InkWell(
                        child: widget.listTopic[index].isSaved ? Assets.icons.saved.svg() : Assets.icons.save.svg(),
                        onTap: (){
                          context.read<SearchBloc>().add(SearchEvent.changeSaveTopic(widget.listTopic[index].topicName));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Gap(16),
          ],
        );
      },
    );
  }
}
