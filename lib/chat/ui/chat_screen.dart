import 'package:chatgpt_clone/chat/ui/widgets/chat_widget.dart';
import 'package:chatgpt_clone/chat/ui/widgets/custom_appbar.dart';
import 'package:chatgpt_clone/chat/ui/widgets/rounded_icon_button.dart';
import 'package:chatgpt_clone/chat/ui/widgets/rounded_text_icon_button.dart';
import 'package:chatgpt_clone/core/helpers/spacing.dart';
import 'package:chatgpt_clone/core/theming/colors.dart';
import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    final safeBottomPadding = bottomInset == 0 ? 20.h : bottomInset.h;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        bottom: false,
        // maintainBottomViewPadding: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Chat body
            const Expanded(
              child: ChatWidget(),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, safeBottomPadding),
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
                          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
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
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




