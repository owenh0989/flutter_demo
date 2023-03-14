import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';
import 'package:lumiere_note_sp/presentation/view_models/init/init_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/init/init_view_model.dart';

final initProvider =
    StateNotifierProvider.autoDispose<InitViewModel, InitState>(
  (ref) {
    final navigationHandler = ref.watch(navigationProvider);

    return InitViewModel(
      navigationHandler: navigationHandler,
    );
  },
);
