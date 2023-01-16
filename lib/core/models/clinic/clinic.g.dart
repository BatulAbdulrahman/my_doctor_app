// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Clinic> _$clinicSerializer = new _$ClinicSerializer();

class _$ClinicSerializer implements StructuredSerializer<Clinic> {
  @override
  final Iterable<Type> types = const [Clinic, _$Clinic];
  @override
  final String wireName = 'Clinic';

  @override
  Iterable<Object?> serialize(Serializers serializers, Clinic object,
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
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumb;
    if (value != null) {
      result
        ..add('thumb')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
  Clinic deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClinicBuilder();

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
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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

class _$Clinic extends Clinic {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? location;
  @override
  final String? img;
  @override
  final String? phone;
  @override
  final String? thumb;
  @override
  final String? day;
  @override
  final String? time;
  @override
  final String? description;
  @override
  final BuiltList<Doctor>? doctors;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  factory _$Clinic([void Function(ClinicBuilder)? updates]) =>
      (new ClinicBuilder()..update(updates))._build();

  _$Clinic._(
      {this.id,
      this.name,
      this.location,
      this.img,
      this.phone,
      this.thumb,
      this.day,
      this.time,
      this.description,
      this.doctors,
      this.created_at,
      this.updated_at})
      : super._();

  @override
  Clinic rebuild(void Function(ClinicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicBuilder toBuilder() => new ClinicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Clinic &&
        id == other.id &&
        name == other.name &&
        location == other.location &&
        img == other.img &&
        phone == other.phone &&
        thumb == other.thumb &&
        day == other.day &&
        time == other.time &&
        description == other.description &&
        doctors == other.doctors &&
        created_at == other.created_at &&
        updated_at == other.updated_at;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                name.hashCode),
                                            location.hashCode),
                                        img.hashCode),
                                    phone.hashCode),
                                thumb.hashCode),
                            day.hashCode),
                        time.hashCode),
                    description.hashCode),
                doctors.hashCode),
            created_at.hashCode),
        updated_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Clinic')
          ..add('id', id)
          ..add('name', name)
          ..add('location', location)
          ..add('img', img)
          ..add('phone', phone)
          ..add('thumb', thumb)
          ..add('day', day)
          ..add('time', time)
          ..add('description', description)
          ..add('doctors', doctors)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at))
        .toString();
  }
}

class ClinicBuilder implements Builder<Clinic, ClinicBuilder> {
  _$Clinic? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

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

  ClinicBuilder();

  ClinicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _location = $v.location;
      _img = $v.img;
      _phone = $v.phone;
      _thumb = $v.thumb;
      _day = $v.day;
      _time = $v.time;
      _description = $v.description;
      _doctors = $v.doctors?.toBuilder();
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Clinic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Clinic;
  }

  @override
  void update(void Function(ClinicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Clinic build() => _build();

  _$Clinic _build() {
    _$Clinic _$result;
    try {
      _$result = _$v ??
          new _$Clinic._(
              id: id,
              name: name,
              location: location,
              img: img,
              phone: phone,
              thumb: thumb,
              day: day,
              time: time,
              description: description,
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
            r'Clinic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
