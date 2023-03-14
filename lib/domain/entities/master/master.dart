import 'package:freezed_annotation/freezed_annotation.dart';

part 'master.freezed.dart';

@freezed
class MasterItem with _$MasterItem {
  factory MasterItem({
    @Default(0) int id,
    @Default('') String label,
  }) = _MasterItem;
}
