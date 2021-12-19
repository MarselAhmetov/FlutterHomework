import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'api_client.dart';
import 'message.dart';
import 'chat_state.dart';

class SetChatStateAction {
  final ChatState chatState;

  SetChatStateAction(this.chatState);
}

Future<void> fetchPostsAction(Store store) async {
  RestClient restClient = RestClient(Dio());
  restClient.getChat().then((List<Message> chat) {
    SetChatStateAction(
      ChatState(
        chat: chat,
      ),
    );
  }).catchError((error) {
    print(error.toString());
  });
}