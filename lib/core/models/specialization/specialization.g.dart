// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Specialization> _$specializationSerializer =
    new _$SpecializationSerializer();

class _$SpecializationSerializer
    implements StructuredSerializer<Specialization> {
  @override
  final Iterable<Type> types = const [Specialization, _$Specialization];
  @override
  final String wireName = 'Specialization';

  @override
  Iterable<Object?> serialize(Serializers serializers, Specialization object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctors;
    if (value != null) {
      result
        ..add('doctors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Doctor)])));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Specialization deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpecializationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Doctor)]))!
              as BuiltList<Object?>);
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Specialization extends Specialization {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final BuiltList<Doctor>? doctors;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  factory _$Specialization([void Function(SpecializationBuilder)? updates]) =>
      (new SpecializationBuilder()..update(updates))._build();

  _$Specialization._(
      {this.id, this.name, this.doctors, this.created_at, this.updated_at})
      : super._();

  @override
  Specialization rebuild(void Function(SpecializationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpecializationBuilder toBuilder() =>
      new SpecializationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Specialization &&
        id == other.id &&
        name == other.name &&
        doctors == other.doctors &&
        created_at == other.created_at &&
        updated_at == other.updated_at;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), doctors.hashCode),
            created_at.hashCode),
        updated_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Specialization')
          ..add('id', id)
          ..add('name', name)
          ..add('doctors', doctors)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at))
        .toString();
  }
}

class SpecializationBuilder
    implements Builder<Specialization, SpecializationBuilder> {
  _$Specialization? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Doctor>? _doctors;
  ListBuilder<Doctor> get doctors =>
      _$this._doctors ??= new ListBuilder<Doctor>();
  set doctors(ListBuilder<Doctor>? doctors) => _$this._doctors = doctors;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  DateTime? _updated_at;
  DateTime? get updated_at => _$this._updated_at;
  set updated_at(DateTime? updated_at) => _$this._updated_at = updated_at;

  SpecializationBuilder();

  SpecializationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _doctors = $v.doctors?.toBuilder();
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Specialization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Specialization;
  }

  @override
  void update(void Function(SpecializationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Specialization build() => _build();

  _$Specialization _build() {
    _$Specialization _$result;
    try {
      _$result = _$v ??
          new _$Specialization._(
              id: id,
              name: name,
              doctors: _doctors?.build(),
              created_at: created_at,
              updated_at: updated_at);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        _doctors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Specialization', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
