import 'package:chatgpt_clone/core/networking/api_paths.dart';
import 'package:chatgpt_clone/features/chat/data/models/chat_model/chat_model.dart';

const chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
        "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
  {
    "msg": "Test loading effect?",
    "chatIndex": 0,
  },
  {
    "msg": "",
    "chatIndex": 1,
  },
];

List<ChatModel> chatModels = [
  ChatModel(
    id: 'openai/gpt-4.1',
    name: 'ChatGPT-4.1',
    endpoint: ApiConstants.githubModels,
  ),
  ChatModel(
    id: 'deepseek/DeepSeek-V3-0324',
    name: 'DeepSeek-V3',
    endpoint: ApiConstants.githubModels,
  ),
  ChatModel(
    id: 'gpt-4o',
    name: 'ChatGPT-4o',
    endpoint: ApiConstants.azureModels,
  ),
  ChatModel(
    id: 'gpt-4o-mini',
    name: 'ChatGPT-4o-Mini',
    endpoint: ApiConstants.azureModels,
  ),
  ChatModel(
    id: 'openai/gpt-4.1-mini',
    name: 'ChatGPT-4.1-Mini',
    endpoint: ApiConstants.githubModels,
  ),
  ChatModel(
    id: 'openai/gpt-4.1-nano',
    name: 'ChatGPT-4.1-Nano',
    endpoint: ApiConstants.githubModels,
  ),
];
