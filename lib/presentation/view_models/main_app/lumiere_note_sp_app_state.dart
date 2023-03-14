import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_state.dart';
import 'package:lumiere_note_sp/utils/base/page_state.dart';

part 'lumiere_note_sp_app_state.freezed.dart';

@freezed
class LumiereNoteSpAppState with _$LumiereNoteSpAppState implements BaseState {
  factory LumiereNoteSpAppState({
    required PageState pageState,
    required bool isLogged,
  }) = _LumiereNoteSpAppState;

  factory LumiereNoteSpAppState.initial() => LumiereNoteSpAppState(
        isLogged: false,
        pageState: PageState.initial,
      );
}
