import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';
import 'package:lumiere_note_sp/presentation/view_models/profile/profile_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/profile/profile_view_model.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>((ref) {
  final navigationHandler = ref.watch(navigationProvider);
  return ProfileViewModel(navigationHandler: navigationHandler);
});
