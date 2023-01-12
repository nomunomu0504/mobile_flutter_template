import "package:flutter_template/store/universal_link/universal_link_state.dart";
import 'package:flutter_template/value_object/universal_link/universal_link.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";

final universalLinkGlobalStoreProvider =
    StateNotifierProvider<UniversalLinkGlobalStore, UniversalLinkState>(
  (ref) => UniversalLinkGlobalStore(),
);

class UniversalLinkGlobalStore extends StateNotifier<UniversalLinkState> {
  UniversalLinkGlobalStore()
      : super(
          const UniversalLinkState(),
        );

  void setUniversalLink(UniversalLink? universalLink) {
    state = state.copyWith(universalLink: universalLink);
  }
}
