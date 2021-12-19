import 'message.dart';

class ChatState {
  final List<Message> chat;

  ChatState({
    required this.chat,
  });

  factory ChatState.initial() => ChatState(
    chat: const [],
  );
}