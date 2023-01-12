// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'universal_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UniversalLink {
  String? get shareRoomId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UniversalLinkCopyWith<UniversalLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversalLinkCopyWith<$Res> {
  factory $UniversalLinkCopyWith(
          UniversalLink value, $Res Function(UniversalLink) then) =
      _$UniversalLinkCopyWithImpl<$Res, UniversalLink>;
  @useResult
  $Res call({String? shareRoomId});
}

/// @nodoc
class _$UniversalLinkCopyWithImpl<$Res, $Val extends UniversalLink>
    implements $UniversalLinkCopyWith<$Res> {
  _$UniversalLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareRoomId = freezed,
  }) {
    return _then(_value.copyWith(
      shareRoomId: freezed == shareRoomId
          ? _value.shareRoomId
          : shareRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UniversalLinkCopyWith<$Res>
    implements $UniversalLinkCopyWith<$Res> {
  factory _$$_UniversalLinkCopyWith(
          _$_UniversalLink value, $Res Function(_$_UniversalLink) then) =
      __$$_UniversalLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? shareRoomId});
}

/// @nodoc
class __$$_UniversalLinkCopyWithImpl<$Res>
    extends _$UniversalLinkCopyWithImpl<$Res, _$_UniversalLink>
    implements _$$_UniversalLinkCopyWith<$Res> {
  __$$_UniversalLinkCopyWithImpl(
      _$_UniversalLink _value, $Res Function(_$_UniversalLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareRoomId = freezed,
  }) {
    return _then(_$_UniversalLink(
      shareRoomId: freezed == shareRoomId
          ? _value.shareRoomId
          : shareRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UniversalLink extends _UniversalLink {
  const _$_UniversalLink({this.shareRoomId}) : super._();

  @override
  final String? shareRoomId;

  @override
  String toString() {
    return 'UniversalLink(shareRoomId: $shareRoomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversalLink &&
            (identical(other.shareRoomId, shareRoomId) ||
                other.shareRoomId == shareRoomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shareRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UniversalLinkCopyWith<_$_UniversalLink> get copyWith =>
      __$$_UniversalLinkCopyWithImpl<_$_UniversalLink>(this, _$identity);
}

abstract class _UniversalLink extends UniversalLink {
  const factory _UniversalLink({final String? shareRoomId}) = _$_UniversalLink;
  const _UniversalLink._() : super._();

  @override
  String? get shareRoomId;
  @override
  @JsonKey(ignore: true)
  _$$_UniversalLinkCopyWith<_$_UniversalLink> get copyWith =>
      throw _privateConstructorUsedError;
}
