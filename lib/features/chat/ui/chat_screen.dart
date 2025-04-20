import 'package:chatgpt_clone/features/chat/ui/widgets/chat_textfield.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/chat_widget.dart';
import 'package:chatgpt_clone/features/chat/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showScrollDownButton = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      final isNotAtBottom = _scrollController.position.pixels < _scrollController.position.maxScrollExtent;
      if (isNotAtBottom != showScrollDownButton) {
        setState(() {
          showScrollDownButton = isNotAtBottom;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ChatWidget(scrollController: _scrollController),
            const ChatTextField(),
          ],
        ),
      ),
    );
  }
}
