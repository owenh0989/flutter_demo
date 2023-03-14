import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/input/pagination_input.dart';
import 'package:lumiere_note_sp/domain/entities/sort/sort.dart';
import 'package:lumiere_note_sp/domain/entities/span/span.dart';

part 'project_search_input.freezed.dart';
part 'project_search_input.g.dart';

@freezed
class ProjectSearchInput with _$ProjectSearchInput {
  factory ProjectSearchInput({
    @Default('') String userToken,
    @Default(0) int tag,
    @Default('') String keyword,
    @Default(0) String categoryId,
    @Default(Span()) Span span,
    @Default(PaginationInput()) PaginationInput pages,
    @Default(Sort()) Sort sort,
  }) = _ProjectSearchInput;

  factory ProjectSearchInput.fromJson(Map<String, Object?> json) =>
      _$ProjectSearchInputFromJson(json);
}
