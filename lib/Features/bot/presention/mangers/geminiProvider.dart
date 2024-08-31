import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as google_ai;
import 'package:gpti/Features/bot/data/messageModel.dart';

class GeminiProvider with ChangeNotifier {
  final TextEditingController userMessage = TextEditingController();
  final ScrollController scrollController = ScrollController();

  static const apiKey = "put you api key here";

  final model = google_ai.GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<MessageModel> messages = [];
  Future<void> sendMessage() async {
    final message = userMessage.text;
    userMessage.clear();

    messages.add(
        MessageModel(isUser: true, message: message, date: DateTime.now()));
    notifyListeners();
    scrollToBottom();

    final content = [google_ai.Content.text(message)];
    final response = await model.generateContent(content);
    messages.add(MessageModel(
        isUser: false, message: response.text ?? "", date: DateTime.now()));
    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
