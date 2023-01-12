// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'universal_link_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UniversalLinkState {
  UniversalLink? get universalLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UniversalLinkStateCopyWith<UniversalLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversalLinkStateCopyWith<$Res> {
  factory $UniversalLinkStateCopyWith(
          UniversalLinkState value, $Res Function(UniversalLinkState) then) =
      _$UniversalLinkStateCopyWithImpl<$Res, UniversalLinkState>;
  @useResult
  $Res call({UniversalLink? universalLink});

  $UniversalLinkCopyWith<$Res>? get universalLink;
}

/// @nodoc
class _$UniversalLinkStateCopyWithImpl<$Res, $Val extends UniversalLinkState>
    implements $UniversalLinkStateCopyWith<$Res> {
  _$UniversalLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? universalLink = freezed,
  }) {
    return _then(_value.copyWith(
      universalLink: freezed == universalLink
          ? _value.universalLink
          : universalLink // ignore: cast_nullable_to_non_nullable
              as UniversalLink?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UniversalLinkCopyWith<$Res>? get universalLink {
    if (_value.universalLink == null) {
      return null;
    }

    return $UniversalLinkCopyWith<$Res>(_value.universalLink!, (value) {
      return _then(_value.copyWith(universalLink: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UniversalLinkStateCopyWith<$Res>
    implements $UniversalLinkStateCopyWith<$Res> {
  factory _$$_UniversalLinkStateCopyWith(_$_UniversalLinkState value,
          $Res Function(_$_UniversalLinkState) then) =
      __$$_UniversalLinkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniversalLink? universalLink});

  @override
  $UniversalLinkCopyWith<$Res>? get universalLink;
}

/// @nodoc
class __$$_UniversalLinkStateCopyWithImpl<$Res>
    extends _$UniversalLinkStateCopyWithImpl<$Res, _$_UniversalLinkState>
    implements _$$_UniversalLinkStateCopyWith<$Res> {
  __$$_UniversalLinkStateCopyWithImpl(
      _$_UniversalLinkState _value, $Res Function(_$_UniversalLinkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? universalLink = freezed,
  }) {
    return _then(_$_UniversalLinkState(
      universalLink: freezed == universalLink
          ? _value.universalLink
          : universalLink // ignore: cast_nullable_to_non_nullable
              as UniversalLink?,
    ));
  }
}

/// @nodoc

class _$_UniversalLinkState extends _UniversalLinkState {
  const _$_UniversalLinkState({this.universalLink}) : super._();

  @override
  final UniversalLink? universalLink;

  @override
  String toString() {
    return 'UniversalLinkState(universalLink: $universalLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversalLinkState &&
            (identical(other.universalLink, universalLink) ||
                other.universalLink == universalLink));
  }

  @override
  int get hashCode => Object.hash(runtimeType, universalLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UniversalLinkStateCopyWith<_$_UniversalLinkState> get copyWith =>
      __$$_UniversalLinkStateCopyWithImpl<_$_UniversalLinkState>(
          this, _$identity);
}

abstract class _UniversalLinkState extends UniversalLinkState {
  const factory _UniversalLinkState({final UniversalLink? universalLink}) =
      _$_UniversalLinkState;
  const _UniversalLinkState._() : super._();

  @override
  UniversalLink? get universalLink;
  @override
  @JsonKey(ignore: true)
  _$$_UniversalLinkStateCopyWith<_$_UniversalLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}
