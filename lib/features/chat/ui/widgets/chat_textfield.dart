import 'package:chatgpt_clone/core/di/dependency_injection.dart';
import 'package:chatgpt_clone/features/chat/data/constants.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';
import 'package:chatgpt_clone/features/chat/data/repos/chat_repo.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/rounded_icon_button.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/rounded_text_icon_button.dart';
import 'package:chatgpt_clone/core/helpers/spacing.dart';
import 'package:chatgpt_clone/core/networking/api_service.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key, required this.chatModel});
  final ValueNotifier<ChatModel> chatModel;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      final bottomPadding =
          isKeyboardVisible ? 10.h : MediaQuery.of(context).viewPadding.bottom;
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
                    cursorColor: Colors.blue,
                    style: TextStyles.font16WhiteRegular,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Message ChatGPT',
                      hintStyle: TextStyles.font16LighterGreyRegular,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
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
                  onTap: () async {
                    ChatRepo chatRepo = ChatRepo(getIt.get<ApiService>());
                    final response = await chatRepo.postCompletion(
                        chatModel: chatModel.value);
                    response.fold(
                      (failure) {
                        print(failure);
                      },
                      (completion) {
                        print('Done');
                        print(completion.choices?[0].message?.content ?? '');
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
