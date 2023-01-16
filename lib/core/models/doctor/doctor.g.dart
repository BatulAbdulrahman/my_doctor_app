// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Doctor> _$doctorSerializer = new _$DoctorSerializer();

class _$DoctorSerializer implements StructuredSerializer<Doctor> {
  @override
  final Iterable<Type> types = const [Doctor, _$Doctor];
  @override
  final String wireName = 'Doctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, Doctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sex;
    if (value != null) {
      result
        ..add('sex')
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
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
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
    value = object.Specializations;
    if (value != null) {
      result
        ..add('Specializations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(Specialization)])));
    }
    value = object.clinics;
    if (value != null) {
      result
        ..add('clinics')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Clinic)])));
    }
    value = object.reviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Review)])));
    }
    value = object.thumb;
    if (value != null) {
      result
        ..add('thumb')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_disabled;
    if (value != null) {
      result
        ..add('is_disabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  Doctor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Specializations':
          result.Specializations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Specialization)]))!
              as BuiltList<Object?>);
          break;
        case 'clinics':
          result.clinics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Clinic)]))!
              as BuiltList<Object?>);
          break;
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Review)]))!
              as BuiltList<Object?>);
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_disabled':
          result.is_disabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$Doctor extends Doctor {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? sex;
  @override
  final String? description;
  @override
  final int? rating;
  @override
  final String? role;
  @override
  final String? img;
  @override
  final BuiltList<Specialization>? Specializations;
  @override
  final BuiltList<Clinic>? clinics;
  @override
  final BuiltList<Review>? reviews;
  @override
  final String? thumb;
  @override
  final bool? is_disabled;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  factory _$Doctor([void Function(DoctorBuilder)? updates]) =>
      (new DoctorBuilder()..update(updates))._build();

  _$Doctor._(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.sex,
      this.description,
      this.rating,
      this.role,
      this.img,
      this.Specializations,
      this.clinics,
      this.reviews,
      this.thumb,
      this.is_disabled,
      this.created_at,
      this.updated_at})
      : super._();

  @override
  Doctor rebuild(void Function(DoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorBuilder toBuilder() => new DoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Doctor &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        password == other.password &&
        sex == other.sex &&
        description == other.description &&
        rating == other.rating &&
        role == other.role &&
        img == other.img &&
        Specializations == other.Specializations &&
        clinics == other.clinics &&
        reviews == other.reviews &&
        thumb == other.thumb &&
        is_disabled == other.is_disabled &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(0,
                                                                        id.hashCode),
                                                                    name.hashCode),
                                                                phone.hashCode),
                                                            email.hashCode),
                                                        password.hashCode),
                                                    sex.hashCode),
                                                description.hashCode),
                                            rating.hashCode),
                                        role.hashCode),
                                    img.hashCode),
                                Specializations.hashCode),
                            clinics.hashCode),
                        reviews.hashCode),
                    thumb.hashCode),
                is_disabled.hashCode),
            created_at.hashCode),
        updated_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Doctor')
          ..add('id', id)
          ..add('name', name)
          ..add('phone', phone)
          ..add('email', email)
          ..add('password', password)
          ..add('sex', sex)
          ..add('description', description)
          ..add('rating', rating)
          ..add('role', role)
          ..add('img', img)
          ..add('Specializations', Specializations)
          ..add('clinics', clinics)
          ..add('reviews', reviews)
          ..add('thumb', thumb)
          ..add('is_disabled', is_disabled)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at))
        .toString();
  }
}

class DoctorBuilder implements Builder<Doctor, DoctorBuilder> {
  _$Doctor? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _sex;
  String? get sex => _$this._sex;
  set sex(String? sex) => _$this._sex = sex;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  ListBuilder<Specialization>? _Specializations;
  ListBuilder<Specialization> get Specializations =>
      _$this._Specializations ??= new ListBuilder<Specialization>();
  set Specializations(ListBuilder<Specialization>? Specializations) =>
      _$this._Specializations = Specializations;

  ListBuilder<Clinic>? _clinics;
  ListBuilder<Clinic> get clinics =>
      _$this._clinics ??= new ListBuilder<Clinic>();
  set clinics(ListBuilder<Clinic>? clinics) => _$this._clinics = clinics;

  ListBuilder<Review>? _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review>? reviews) => _$this._reviews = reviews;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  bool? _is_disabled;
  bool? get is_disabled => _$this._is_disabled;
  set is_disabled(bool? is_disabled) => _$this._is_disabled = is_disabled;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  DateTime? _updated_at;
  DateTime? get updated_at => _$this._updated_at;
  set updated_at(DateTime? updated_at) => _$this._updated_at = updated_at;

  DoctorBuilder();

  DoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _phone = $v.phone;
      _email = $v.email;
      _password = $v.password;
      _sex = $v.sex;
      _description = $v.description;
      _rating = $v.rating;
      _role = $v.role;
      _img = $v.img;
      _Specializations = $v.Specializations?.toBuilder();
      _clinics = $v.clinics?.toBuilder();
      _reviews = $v.reviews?.toBuilder();
      _thumb = $v.thumb;
      _is_disabled = $v.is_disabled;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Doctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Doctor;
  }

  @override
  void update(void Function(DoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Doctor build() => _build();

  _$Doctor _build() {
    _$Doctor _$result;
    try {
      _$result = _$v ??
          new _$Doctor._(
              id: id,
              name: name,
              phone: phone,
              email: email,
              password: password,
              sex: sex,
              description: description,
              rating: rating,
              role: role,
              img: img,
              Specializations: _Specializations?.build(),
              clinics: _clinics?.build(),
              reviews: _reviews?.build(),
              thumb: thumb,
              is_disabled: is_disabled,
              created_at: created_at,
              updated_at: updated_at);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Specializations';
        _Specializations?.build();
        _$failedField = 'clinics';
        _clinics?.build();
        _$failedField = 'reviews';
        _reviews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Doctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
