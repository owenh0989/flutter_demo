import 'dart:async';
import 'package:lumiere_note_sp/presentation/navigation/app_router.gr.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_handler.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_view_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_state.dart';

class LoginViewModel extends BaseViewModel<LoginState> {
  LoginViewModel({required this.navigationHandler}) : super(LoginState());

  final NavigationHandler navigationHandler;

  @override
  Future<void> onInit() async {}

  void gotoHome() {
    navigationHandler.push(route: InitPageRoute());
  }
}
