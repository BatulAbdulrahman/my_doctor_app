import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';

import '../../../core/models/post/post.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import 'posts_view_model.dart';

// ignore: must_be_immutable
class PostsView extends StatefulWidget {
  Post post;

  PostsView(this.post);

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(PostsView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   _pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      viewModelBuilder: () => PostsViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.post);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              // drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 0.4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        UIHelper.verticalSpaceMedium(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 0, 4, 0),
                                                child: Text(
                                                  model.post!.title!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(model.post!.body!,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .color!
                                                                  .withOpacity(
                                                                      0.6)),
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                              ]),
                                        ),
                                        UIHelper.verticalSpaceMedium(),
                                        UIHelper.verticalSpaceMedium(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
    );
  }
}
