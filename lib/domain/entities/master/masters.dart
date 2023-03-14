import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/master/master.dart';

part 'masters.freezed.dart';

@freezed
class MastersItem with _$MastersItem {
  factory MastersItem({
    @Default([]) List<MasterItem> items,
  }) = _MastersItem;
}
