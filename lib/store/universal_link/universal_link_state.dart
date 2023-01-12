import 'package:flutter_template/value_object/universal_link/universal_link.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part "universal_link_state.freezed.dart";

@freezed
class UniversalLinkState with _$UniversalLinkState {
  const UniversalLinkState._();

  const factory UniversalLinkState({
    UniversalLink? universalLink,
  }) = _UniversalLinkState;
}
