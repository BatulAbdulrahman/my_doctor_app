import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
part 'clinic.g.dart';

abstract class Clinic implements Built<Clinic, ClinicBuilder> {
  int? get id; // uuid

  String? get name;

  String? get location;

  String? get img;

  String? get phone;

  String? get thumb;

  String? get day;

  String? get time;

  String? get description;

  DateTime? get created_at;

  DateTime? get updated_at;
  Clinic._();

  String toJson() {
    return json.encode(serializers.serializeWith(Clinic.serializer, this));
  }

  factory Clinic.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Clinic.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Clinic.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Clinic.serializer,
      map,
    )!;
  }

  static Serializer<Clinic> get serializer => _$clinicSerializer;

  factory Clinic([void Function(ClinicBuilder)? updates]) = _$Clinic;
}
