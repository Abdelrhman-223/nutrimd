/*
**********Project Name: nutrimd
**********File Name: chat_controller
**********Created At: 05-May-24 6:51 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:nutrimd/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../api_connection.dart';

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


  chatbotFunction(Map<String, dynamic> urlRequest) async {
    /*var url = Uri.http(ApiManager.urlBase, ApiManager().urlDomains["chatbot"]!, urlRequest);*/
    /*
    var url = Uri(path: "http://${ApiManager.urlBase}/${ApiManager().urlDomains["chatbot"]!}/$urlRequest");*/
    var url = Uri(query: "http://${ApiManager.urlBase}/${ApiManager().urlDomains["chatbot"]!}");

    print(url);
    var response = await http.get(url);
    var responseData = jsonDecode(response.body);

    print("Status is ${responseData["response"]}");

    addNewMessages(responseData["response"]);
    update();
  }
}
