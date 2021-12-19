import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'message.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<Message>> getChat();

  @POST("/chat")
  Future<Message> sendMessage(@Body() Message message);
}