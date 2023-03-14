import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';
import 'package:lumiere_note_sp/presentation/view_models/main_app/lumiere_note_sp_app_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/main_app/lumiere_note_sp_app_view_model.dart';

final lumiereNoteSpAppProvider = StateNotifierProvider.autoDispose<
    LumiereNoteSpAppViewModel, LumiereNoteSpAppState>(
  (ref) {
    final navigation = ref.watch(navigationProvider);

    return LumiereNoteSpAppViewModel(
      navigationHandler: navigation,
    );
  },
);
