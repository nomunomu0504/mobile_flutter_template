import "package:freezed_annotation/freezed_annotation.dart";

part "universal_link.freezed.dart";

@freezed
class UniversalLink with _$UniversalLink {
  const UniversalLink._();

  const factory UniversalLink({
    String? shareRoomId,
  }) = _UniversalLink;
}
