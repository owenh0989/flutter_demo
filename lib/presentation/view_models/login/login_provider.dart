import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/login/login_view_model.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) {
    final navigationHandler = ref.watch(navigationProvider);

    return LoginViewModel(navigationHandler: navigationHandler);
  },
);
