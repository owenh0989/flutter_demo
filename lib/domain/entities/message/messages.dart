import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/message/message.dart';

part 'messages.freezed.dart';

@freezed
class Messages with _$Messages {
  const factory Messages({
    @Default([]) List<Message> items,
  }) = _Messages;
}
