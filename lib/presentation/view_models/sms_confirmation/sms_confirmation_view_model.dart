import 'package:lumiere_note_sp/presentation/navigation/app_router.gr.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_handler.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_view_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/sms_confirmation/sms_confirmation_state.dart';

class SmsConfirmationViewModel extends BaseViewModel<SmsConfirmationState> {
  SmsConfirmationViewModel({required this.navigationHandler})
      : super(SmsConfirmationState());
  final NavigationHandler navigationHandler;

  @override
  void onInit() {
    // TODO: implement onInit
  }

  Future<void> submitAction() async {
    await navigationHandler.push(route: WelcomePageRoute());
  }
}
