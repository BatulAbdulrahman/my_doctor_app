import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/post_tile/post_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/post/post.dart';

/// A list tile for an article.
class PostTile extends StatelessWidget {
  final Post? post;
  final ValueChanged<Post> onChanged;

  const PostTile({this.post, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostTileViewModel>.nonReactive(
      viewModelBuilder: () => PostTileViewModel(),
      onModelReady: (model) => model.init(post),
      builder: (context, model, child) => Card(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 7, bottom: 7),
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            return onChanged(post!);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Text(
                                  post!.title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  post!.body!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: TextStyle(
                                      //height: 1.5,
                                      fontSize: 11,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!
                                          .withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
