import 'package:chatgpt_clone/features/chat/ui/widgets/gpt_markdown_text.dart';
import 'package:flutter/material.dart';

class AnimatedGptMarkdownText extends StatefulWidget {
  final String fullText;
  final Duration charDelay;

  const AnimatedGptMarkdownText({
    super.key,
    required this.fullText,
    this.charDelay = const Duration(milliseconds: 20),
  });

  @override
  State<AnimatedGptMarkdownText> createState() => _AnimatedGptMarkdownTextState();
}

class _AnimatedGptMarkdownTextState extends State<AnimatedGptMarkdownText> {
  late String _visibleText;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _visibleText = '';
    _startTyping();
  }

  Duration _getCharDelay(String char) {
    const fastChars = {'`', '*', '#', '[', ']', '(', ')', '-', '_', ':', '>', ' '};
    if (fastChars.contains(char)) return const Duration(milliseconds: 4);
    if (char == '\n') return const Duration(milliseconds: 10);
    return widget.charDelay;
  }

  void _startTyping() {
    void typeNextChar() {
      if (_currentIndex < widget.fullText.length) {
        setState(() {
          _visibleText += widget.fullText[_currentIndex];
          _currentIndex++;
        });

        final delay = _getCharDelay(_visibleText.characters.last);
        Future.delayed(delay, typeNextChar);
      }
    }

    typeNextChar();
  }

  @override
  Widget build(BuildContext context) {
    return GptMarkdownText(visibleText: _visibleText);
  }
}


