import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_state.dart';
import 'package:lumiere_note_sp/utils/base/page_state.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState implements BaseState {
  factory SignUpState({
    @Default('') String email,
    String? emailError,
    @Default('') String password,
    String? passwordError,
    String? name,
    String? phoneNumber,
    String? sex,
    String? date,
    String? month,
    String? year,
    @Default(PageState.initial) PageState pageState,
    @Default(FormStatus.initial) FormStatus formStatus,
  }) = _SignUpState;
}
