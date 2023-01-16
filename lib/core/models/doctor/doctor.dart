import 'dart:convert';
import 'dart:ffi';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/core/models/review/review.dart';
import '../clinic/clinic.dart';
import '../specialization/specialization.dart';
import '/core/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
part 'doctor.g.dart';

abstract class Doctor implements Built<Doctor, DoctorBuilder> {
  String? get id; // uuid

  String? get name;

  String? get phone;

  String? get email;

  String? get password;

  String? get sex;

  String? get description;

  int? get rating;

  String? get role;

  String? get img;

  BuiltList<Specialization>? get Specializations;

  BuiltList<Clinic>? get clinics;

  BuiltList<Review>? get reviews;

  String? get thumb;

  bool? get is_disabled;

  DateTime? get created_at;
  DateTime? get updated_at;
  Doctor._();

  String toJson() {
    return json.encode(serializers.serializeWith(Doctor.serializer, this));
  }

  factory Doctor.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Doctor.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Doctor.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Doctor.serializer,
      map,
    )!;
  }

  static Serializer<Doctor> get serializer => _$doctorSerializer;

  factory Doctor([void Function(DoctorBuilder)? updates]) = _$Doctor;
}
