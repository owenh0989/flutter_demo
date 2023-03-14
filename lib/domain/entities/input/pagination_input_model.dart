import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/span/span.dart';

part 'pagination_input_model.freezed.dart';

@freezed
class PaginationInputModel with _$PaginationInputModel {
  factory PaginationInputModel({
    @Default(0) int take,
    @Default(0) int ship,
  }) = _PaginationInputModel;
}
