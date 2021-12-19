import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'api_client.dart';
import 'message.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  final String _author = 'Marsel';
  RestClient restClient = RestClient(Dio());

  @observable
  ObservableList<Message> chat = ObservableList.of([]);

  @action
  void fetchChat() {
    restClient.getChat().then((List<Message> messages) async{
      chat.clear();
      chat.addAll(messages);
    }).catchError((error) {
      print(error.toString());
    });
  }

  @action
  void sendMessage(String textMessage, {Function? onSend}) {
    Message message = Message(author: _author, message: textMessage);

    restClient.sendMessage(message).then((Message message) {
      chat.add(message);

      if (onSend != null) {
        onSend();
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
