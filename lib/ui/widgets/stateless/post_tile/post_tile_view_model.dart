import 'package:stacked/stacked.dart';

import '../../../../core/models/post/post.dart';

class PostTileViewModel extends BaseViewModel {
  Post? _post;

  Post? get post => _post;

  void init(Post? post) {
    _post = post;
  }
}
