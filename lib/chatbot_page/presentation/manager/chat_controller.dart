/*
**********Project Name: nutrimd
**********File Name: chat_controller
**********Created At: 05-May-24 6:51 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:nutrimd/main.dart';

class ChatBotController extends GetxController {
  List<String> chatMessages = ["Hello '@',\nHow can i help you :)"];

  /*String getInitMessage(String username) {
    return ;
  }*/

 /* addAllMessages(List<String> messages) {
    chatMessages = messages;

    update();
  }*/

  addNewMessages(String message) {
    chatMessages.add(message);

    //sharedPreferences.s
    update();
  }
}
