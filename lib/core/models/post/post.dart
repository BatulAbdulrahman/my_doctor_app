import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'post.g.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Post implements Built<Post, PostBuilder> {
  int? get id;

  String? get title;

  String? get body;

  DateTime? get created_at;

  Post._();

  String toJson() {
    return json.encode(serializers.serializeWith(Post.serializer, this));
  }

  factory Post.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Post.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Post.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Post.serializer,
      map,
    )!;
  }

  static Serializer<Post> get serializer => _$postSerializer;

  factory Post([void Function(PostBuilder)? updates]) = _$Post;
}
