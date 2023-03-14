import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/presentation/pages/search/mock/mock_search.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_state.dart';
import 'package:lumiere_note_sp/utils/base/page_state.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState implements BaseState {
  factory SearchState({
    @Default(PageState.initial) PageState pageState,
    @Default([]) List<SearchModel> listSearch,
  }) = _SearchState;
}
