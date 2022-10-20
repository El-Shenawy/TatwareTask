import 'package:flutter/material.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_components.dart';
import 'package:task/utilities/app_constants.dart';
import 'package:task/utilities/app_strings.dart';
import 'package:task/utilities/font_manager.dart';
import 'package:task/utilities/size_config.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              children: [
                ChatItem2(
                  message: "Hi, Whats You Name Firstname?",
                ),
                ChatItem(
                  message: "Abdalla",
                ),
                ChatItem2(
                  message: "Ok, Abdalla Whats Your Lastname?",
                ),
                ChatItem(
                  message: "Salah",
                ),
                ChatItem2(
                  message: "Mr Abdalla Salah, What's your Title?",
                ),
                ChatItem(
                  message: "Front-end Developer",
                ),
                ChatItem2(
                  message: "What Categories you will need expert In?",
                ),
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customTextField(
                            uperText: "",
                            hintText: "Type something…",
                            controller: textEditingController),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            send,
                            scale: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  String? message;
  ChatItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Container(
            height: SizeConfig.screenHeight * 0.06,
            width: SizeConfig.screenWidth * 0.6,
            padding: const EdgeInsets.only(right: AppPadding.p16),
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m4),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: AppPadding.p16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message!,
                    style: bodyTextStyle.copyWith(
                        fontSize: FontSize.s14, color: white),
                  )),
            ),
          ),
        ),
        Image.asset(
          seen,
          scale: 3,
        )
      ],
    );
  }
}

class ChatItem2 extends StatelessWidget {
  String? message;
  ChatItem2({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          boot,
          scale: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Container(
            height: SizeConfig.screenHeight * 0.06,
            width: SizeConfig.screenWidth * 0.75,
            padding: const EdgeInsets.only(right: AppPadding.p16),
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m4),
            decoration: BoxDecoration(
              color: colorLightGray,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: AppPadding.p16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message!,
                    style: bodyTextStyle.copyWith(
                        fontSize: FontSize.s14, color: black),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
