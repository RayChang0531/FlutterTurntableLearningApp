// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SongDataList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SongData {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongDataCopyWith<SongData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDataCopyWith<$Res> {
  factory $SongDataCopyWith(SongData value, $Res Function(SongData) then) =
      _$SongDataCopyWithImpl<$Res, SongData>;
  @useResult
  $Res call({int id, String text, Color color});
}

/// @nodoc
class _$SongDataCopyWithImpl<$Res, $Val extends SongData>
    implements $SongDataCopyWith<$Res> {
  _$SongDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongDataImplCopyWith<$Res>
    implements $SongDataCopyWith<$Res> {
  factory _$$SongDataImplCopyWith(
          _$SongDataImpl value, $Res Function(_$SongDataImpl) then) =
      __$$SongDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text, Color color});
}

/// @nodoc
class __$$SongDataImplCopyWithImpl<$Res>
    extends _$SongDataCopyWithImpl<$Res, _$SongDataImpl>
    implements _$$SongDataImplCopyWith<$Res> {
  __$$SongDataImplCopyWithImpl(
      _$SongDataImpl _value, $Res Function(_$SongDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_$SongDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$SongDataImpl implements _SongData {
  _$SongDataImpl({required this.id, required this.text, required this.color});

  @override
  final int id;
  @override
  final String text;
  @override
  final Color color;

  @override
  String toString() {
    return 'SongData(id: $id, text: $text, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongDataImplCopyWith<_$SongDataImpl> get copyWith =>
      __$$SongDataImplCopyWithImpl<_$SongDataImpl>(this, _$identity);
}

abstract class _SongData implements SongData {
  factory _SongData(
      {required final int id,
      required final String text,
      required final Color color}) = _$SongDataImpl;

  @override
  int get id;
  @override
  String get text;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$SongDataImplCopyWith<_$SongDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
