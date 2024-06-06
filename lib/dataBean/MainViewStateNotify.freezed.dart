// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MainViewStateNotify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainViewState {
  int get userCount => throw _privateConstructorUsedError;
  set userCount(int value) => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  set currentIndex(int value) => throw _privateConstructorUsedError;
  List<String> get userSelection => throw _privateConstructorUsedError;
  set userSelection(List<String> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainViewStateCopyWith<MainViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainViewStateCopyWith<$Res> {
  factory $MainViewStateCopyWith(
          MainViewState value, $Res Function(MainViewState) then) =
      _$MainViewStateCopyWithImpl<$Res, MainViewState>;
  @useResult
  $Res call({int userCount, int currentIndex, List<String> userSelection});
}

/// @nodoc
class _$MainViewStateCopyWithImpl<$Res, $Val extends MainViewState>
    implements $MainViewStateCopyWith<$Res> {
  _$MainViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCount = null,
    Object? currentIndex = null,
    Object? userSelection = null,
  }) {
    return _then(_value.copyWith(
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userSelection: null == userSelection
          ? _value.userSelection
          : userSelection // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainViewStateImplCopyWith<$Res>
    implements $MainViewStateCopyWith<$Res> {
  factory _$$MainViewStateImplCopyWith(
          _$MainViewStateImpl value, $Res Function(_$MainViewStateImpl) then) =
      __$$MainViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userCount, int currentIndex, List<String> userSelection});
}

/// @nodoc
class __$$MainViewStateImplCopyWithImpl<$Res>
    extends _$MainViewStateCopyWithImpl<$Res, _$MainViewStateImpl>
    implements _$$MainViewStateImplCopyWith<$Res> {
  __$$MainViewStateImplCopyWithImpl(
      _$MainViewStateImpl _value, $Res Function(_$MainViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCount = null,
    Object? currentIndex = null,
    Object? userSelection = null,
  }) {
    return _then(_$MainViewStateImpl(
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userSelection: null == userSelection
          ? _value.userSelection
          : userSelection // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MainViewStateImpl implements _MainViewState {
  _$MainViewStateImpl(
      {required this.userCount,
      required this.currentIndex,
      required this.userSelection});

  @override
  int userCount;
  @override
  int currentIndex;
  @override
  List<String> userSelection;

  @override
  String toString() {
    return 'MainViewState(userCount: $userCount, currentIndex: $currentIndex, userSelection: $userSelection)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainViewStateImplCopyWith<_$MainViewStateImpl> get copyWith =>
      __$$MainViewStateImplCopyWithImpl<_$MainViewStateImpl>(this, _$identity);
}

abstract class _MainViewState implements MainViewState {
  factory _MainViewState(
      {required int userCount,
      required int currentIndex,
      required List<String> userSelection}) = _$MainViewStateImpl;

  @override
  int get userCount;
  set userCount(int value);
  @override
  int get currentIndex;
  set currentIndex(int value);
  @override
  List<String> get userSelection;
  set userSelection(List<String> value);
  @override
  @JsonKey(ignore: true)
  _$$MainViewStateImplCopyWith<_$MainViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
