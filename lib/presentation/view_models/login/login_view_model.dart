import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lumiere_note_sp/generated/locale_keys.g.dart';
import 'package:lumiere_note_sp/presentation/navigation/app_router.gr.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_handler.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_view_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_validate.dart';

class LoginViewModel extends BaseViewModel<LoginState> {
  LoginViewModel({required this.navigationHandler}) : super(LoginState());

  final NavigationHandler navigationHandler;

  @override
  Future<void> onInit() async {}

  void onEmailChange(String email) {
    setState((state) => state.copyWith(email: email));
  }

  void onPasswordChange(String password) {
    setState((state) => state.copyWith(password: password));
  }

  String getErrorMessage() {
    switch (state.formStatus) {
      case FormStatus.initial:
        return LocaleKeys.empty.tr();
      case FormStatus.invalid:
        return LocaleKeys.loginErrorLabel.tr();
      case FormStatus.valid:
        return LocaleKeys.empty.tr();
    }
  }

  Future<bool> loginAction() async {
    final isFormValid = isEmailValid() && isPasswordValid();
    setState((state) => state.copyWith(
        formStatus: isFormValid ? FormStatus.valid : FormStatus.invalid));
    if (isFormValid) {
      bool isLoading = true;
      if (isLoading) {
        await EasyLoading.show(
          maskType: EasyLoadingMaskType.black,
        );
      }
    }
    return false;
  }

  void goToSignUpPage() {
    navigationHandler.push(route: SignUpPageRoute());
  }

  void gotoHome() {
    navigationHandler.push(route: InitPageRoute());
  }

  void forgotPasswordAction() {}

  bool isEmailValid() {
    return LoginValidationResults.validateEmail(state.email).isValid;
  }

  bool isPasswordValid() {
    return LoginValidationResults.validatePassword(state.password).isValid;
  }
}
