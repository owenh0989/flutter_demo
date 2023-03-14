import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/view_models/search/search_state.dart';
import 'package:lumiere_note_sp/presentation/view_models/search/search_view_model.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
  (ref) {
    return SearchViewModel();
  },
);
