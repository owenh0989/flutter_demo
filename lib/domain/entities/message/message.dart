import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/reply/reply.dart';
import 'package:lumiere_note_sp/domain/entities/user/user.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  factory Message({
    @Default('') String id,
    @Default(User()) User sender,
    @Default('') String text,
    @Default(DateTime) DateTime createDate,
    @Default(DateTime)DateTime updateDate,
    @Default([]) List<Reply> replies,
  }) = _Message;
}
