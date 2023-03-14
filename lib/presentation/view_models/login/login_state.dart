import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_state.dart';
import 'package:lumiere_note_sp/utils/base/page_state.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState implements BaseState {
  factory LoginState({
    @Default('') String email,
    String? emailError,
    @Default('') String password,
    String? passwordError,
    @Default(PageState.initial) PageState pageState,
    @Default(FormStatus.initial) FormStatus formStatus,
  }) = _LoginState;
}

enum FormStatus { initial, invalid, valid }
