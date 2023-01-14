import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
part 'specialization.g.dart';

abstract class Specialization
    implements Built<Specialization, SpecializationBuilder> {
  int? get id; // uuid

  String? get name;

  DateTime? get created_at;

  DateTime? get updated_at;
  Specialization._();

  String toJson() {
    return json
        .encode(serializers.serializeWith(Specialization.serializer, this));
  }

  factory Specialization.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Specialization.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Specialization.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Specialization.serializer,
      map,
    )!;
  }

  static Serializer<Specialization> get serializer =>
      _$specializationSerializer;

  factory Specialization([void Function(SpecializationBuilder)? updates]) =
      _$Specialization;
}
