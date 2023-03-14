import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_state.dart';
import 'package:lumiere_note_sp/utils/base/page_state.dart';

part 'sms_confirmation_state.freezed.dart';

@freezed
class SmsConfirmationState with _$SmsConfirmationState implements BaseState {
  factory SmsConfirmationState({
    @Default(PageState.initial) PageState pageState,
  }) = _SmsConfirmationState;
}
