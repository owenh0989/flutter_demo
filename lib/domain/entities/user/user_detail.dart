import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/image/image.dart';
import 'package:lumiere_note_sp/domain/entities/project/project.dart';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    @Default("") String id,
    @Default('') String name,
    String? title,
    String? overview,
    Image? icon,
    @Default([]) List<Project> favoriteProject,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, Object?> json) =>
      _$UserDetailFromJson(json);
}
