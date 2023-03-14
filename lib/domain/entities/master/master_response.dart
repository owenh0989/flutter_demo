import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/master/masters.dart';

part 'master_response.freezed.dart';

@freezed
class MasterResponseModel with _$MasterResponseModel {
  factory MasterResponseModel({
    @Default(0) MastersItem result,
    @Default('') List<String> errors,
    @Default(false) bool isSuccess,
  }) = _MasterResponseModel;
}
