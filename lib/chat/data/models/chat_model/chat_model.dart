class ChatModel {
  final String id;
  final String name;

  ChatModel({
    required this.id,
    required this.name,
  });
}

List<ChatModel> chatModels = [
  ChatModel(id: 'openai/gpt-4.1', name: 'ChatGPT-4.1'),
  ChatModel(id: 'deepseek/DeepSeek-V3-0324', name: 'DeepSeek-V3'),
  ChatModel(id: 'meta/Llama-4-Scout-17B-16E-Instruct"', name: 'Llama-4'),
  ChatModel(id: 'gpt-4o', name: 'ChatGPT-4o'),
  ChatModel(id: 'gpt-4o-mini', name: 'ChatGPT-4o-Mini'),
  ChatModel(id: 'openai/gpt-4.1-mini', name: 'ChatGPT-4.1-Mini'),
  ChatModel(id: 'openai/gpt-4.1-nano', name: 'ChatGPT-4.1-Nano'),
];
