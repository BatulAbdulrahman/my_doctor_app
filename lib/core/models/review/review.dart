import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'review.g.dart';

/// An example review model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Review implements Built<Review, ReviewBuilder> {
  String? get id;

  String? get user_id;

  int? get rate;

  String? get comment;

  Review._();

  String toJson() {
    return json.encode(serializers.serializeWith(Review.serializer, this));
  }

  factory Review.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Review.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Review.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Review.serializer,
      map,
    )!;
  }

  static Serializer<Review> get serializer => _$reviewSerializer;

  factory Review([void Function(ReviewBuilder)? updates]) = _$Review;
}
