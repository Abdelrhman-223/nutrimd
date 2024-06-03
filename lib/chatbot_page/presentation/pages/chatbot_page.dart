/*
**********Project Name: nutrimd
**********File Name: chatbot_page
**********Created At: 05-May-24 6:48 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nutrimd/chatbot_page/presentation/manager/chat_controller.dart';
import 'package:nutrimd/chatbot_page/presentation/widgets/message_field.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/utils/app_icons.dart';

class ChatBotPage extends StatelessWidget {
  ChatBotPage({super.key});

  final double messageFieldSize = 50;

  TextEditingController chatBotMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatBotController>(
        init: ChatBotController(),
        builder: (chatBotController) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: chatBotController.chatMessages.length,
                    itemBuilder: (context, index) => MessageField(
                        isItFromUser: (index % 2 == 0) ? false : true,
                        fieldContent: chatBotController.chatMessages[index]),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: messageFieldSize,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: messageFieldSize,
                            padding: EdgeInsets.only(right: 16, left: messageFieldSize + 16),
                            decoration: BoxDecoration(
                              color: AppColors.fifthColor,
                              borderRadius: BorderRadius.circular(messageFieldSize),
                              border: GradientBoxBorder(
                                width: 2,
                                gradient: AppColors.hRtLLinearDarkGrid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: chatBotMessageController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter message",
                                      hintStyle: TextStyle(
                                        color: AppColors.fourthColor,
                                      ),
                                    ),
                                    cursorColor: AppColors.secondColor,
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (chatBotMessageController.text != "" &&
                                        chatBotController.chatMessages.length % 2 == 1) {
                                      chatBotController
                                          .addNewMessages(chatBotMessageController.text);
                                      chatBotController
                                          .chatbotFunction(chatBotMessageController.text);
                                      chatBotMessageController.clear();
                                    }
                                  },
                                  child: SvgPicture.asset(AppIcons.send),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: messageFieldSize,
                              height: messageFieldSize,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(messageFieldSize),
                                border: GradientBoxBorder(
                                  width: 2,
                                  gradient: AppColors.hLtRLinearDarkGrid,
                                ),
                              ),
                              child: SvgPicture.asset(AppIcons.mic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
