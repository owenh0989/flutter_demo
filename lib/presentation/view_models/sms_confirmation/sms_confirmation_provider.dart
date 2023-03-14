import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';
import 'package:lumiere_note_sp/presentation/view_models/sms_confirmation/sms_confirmation_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/sms_confirmation/sms_confirmation_view_model.dart';

final smsConfirmationProvider = StateNotifierProvider.autoDispose<
    SmsConfirmationViewModel, SmsConfirmationState>((ref) {
  final navigationHandler = ref.watch(navigationProvider);
  return SmsConfirmationViewModel(navigationHandler: navigationHandler);
});
