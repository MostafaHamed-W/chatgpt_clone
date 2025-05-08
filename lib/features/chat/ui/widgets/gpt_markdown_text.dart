import 'package:chatgpt_clone/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class GptMarkdownText extends StatelessWidget {
  const GptMarkdownText({
    super.key,
    required String visibleText,
  }) : _visibleText = visibleText;

  final String _visibleText;

  @override
  Widget build(BuildContext context) {
    return GptMarkdown(
      _visibleText.trim(),
      style: TextStyles.font14WhiteRegular,
      followLinkColor: true,
      onLinkTab: (url, title) {
        //TODO: implment url launcher method
      },
    );
  }
}
