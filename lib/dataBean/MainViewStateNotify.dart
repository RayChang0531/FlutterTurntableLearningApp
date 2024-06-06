import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'MainViewStateNotify.freezed.dart';

part 'MainViewStateNotify.g.dart';

@riverpod
class MainViewStateNotify extends _$MainViewStateNotify {
  @override
  MainViewState build() =>
      MainViewState(userCount: 0, currentIndex: -1, userSelection: []);

  void updateCurrentIndex(int currentIndex) {
    state.currentIndex = currentIndex;
  }

  void resetCurrentIndex() {
    state.currentIndex = -1;
  }
}

@unfreezed
class MainViewState with _$MainViewState {
  factory MainViewState({
    required int userCount,
    required int currentIndex,
    required List<String> userSelection,
  }) = _MainViewState;
}
