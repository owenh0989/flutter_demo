import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/image/image.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    String? name,
    String? title,
    String? overview,
    @Default(Image()) Image icon,
  }) = _User;
}
