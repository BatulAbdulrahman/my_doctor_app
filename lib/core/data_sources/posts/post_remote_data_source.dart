import 'dart:async';

import '/core/constant/api_routes.dart';
import '/core/services/http/http_service.dart';
import '/locator.dart';
import '../../models/post/post.dart';

abstract class PostsRemoteDataSource {
  Future<Post> fetchPost([Map<String, dynamic>? parameters]);

  Future<List<Post>> fetchPostsList([Map<String, dynamic>? parameters]);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Post> fetchPost([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.post(parameters!['id']), parameters));

    return Post.fromMap(restData['data']);
  }

  @override
  Future<List<Post>> fetchPostsList([Map<String, dynamic>? parameters]) async {
    List<dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.posts, parameters);

    var items =
        jsonData.map<Post>((vendorMap) => Post.fromMap(vendorMap)).toList();

    //    var list = newsJsonData['data'] as List<dynamic>;

    return items;
  }
}
