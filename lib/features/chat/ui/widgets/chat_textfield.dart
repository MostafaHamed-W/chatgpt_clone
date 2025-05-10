import 'package:chatgpt_clone/core/widgets/custom_toast.dart';
import 'package:chatgpt_clone/features/chat/logic/chat_model_provider.dart';
import 'package:chatgpt_clone/features/chat/logic/chat_provider.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/rounded_icon_button.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/rounded_text_icon_button.dart';
import 'package:chatgpt_clone/core/helpers/spacing.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController chatController = TextEditingController();

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        final bottomPadding = isKeyboardVisible ? 10.h : MediaQuery.of(context).viewPadding.bottom;
        final modelProvider = context.read<ChatModelProvider>();
        final chatProvider = context.read<ChatProvider>();

        void sendMessage() async {

          // Prevent sending empty message
          if (chatController.text.isEmpty) {
            CustomToast.instance.showDefaultToast(
              context,
              message: 'Please enter a valid message',
            );
            return;
          }

          // Select Ai model
          final msg = chatController.text;
          final selectedModel = modelProvider.selectedModel!;

          // To clear textfield after send message
          chatProvider.addUserMessage(userMessage: msg);
          chatController.clear();

          // To dispose keyboard after send message
          FocusManager.instance.primaryFocus?.unfocus();


          //TODO: Implment new scroll on send & animate method
          // Animate to max scroll intent
          // widget.scrollController.animateTo(
          //   widget.scrollController.position.maxScrollExtent,
          //   duration: const Duration(seconds: 1),
          //   curve: Curves.easeOut,
          // );

          await chatProvider.sendMessage(
            chatModel: selectedModel,
            chatMessage: msg,
            context: context,
          );
        }

        return Container(
          padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, bottomPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: ColorsManager.backgroundDark,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController,
                      minLines: 1,
                      maxLines: 3,
                      cursorColor: Colors.blue,
                      style: TextStyles.font16WhiteRegular,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Message ChatGPT',
                        hintStyle: TextStyles.font16LighterGreyRegular,
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RoundedIconButton(
                    icon: Icons.add,
                    borderColor: Colors.white,
                    borderWidth: 0.3,
                    onTap: () {},
                  ),
                  horizentalWidth(7),
                  RoundedTextIconButton(
                    text: 'Search',
                    icon: Icons.language,
                    borderWidth: 0.3,
                    onTap: (selected) {},
                  ),
                  horizentalWidth(7),
                  RoundedTextIconButton(
                    text: "Reason",
                    icon: Icons.lightbulb_outlined,
                    borderWidth: 0.3,
                    onTap: (selected) {},
                  ),
                  const Spacer(),
                  RoundedIconButton(
                    icon: Icons.mic,
                    borderWidth: 0.3,
                    onTap: () {},
                  ),
                  horizentalWidth(10),
                  RoundedIconButton(
                    icon: Icons.arrow_upward,
                    backgroundColor: Colors.white,
                    iconColor: Colors.black,
                    onTap: sendMessage,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
