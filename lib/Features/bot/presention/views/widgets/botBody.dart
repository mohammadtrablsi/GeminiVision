import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gpti/Features/bot/data/messageModel.dart';
import 'package:gpti/Features/bot/presention/mangers/geminiProvider.dart';

import 'package:gpti/Features/bot/presention/views/widgets/message.dart';
import 'package:gpti/core/utils/classes/customTextField.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BotBody extends StatelessWidget {
  const BotBody({super.key});

  @override
  Widget build(BuildContext context) {
    final geminiProvider = Provider.of<GeminiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini'),
      ),
      body: Consumer<GeminiProvider>(builder: (context, prov, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _messagesPart(geminiProvider),
            _sendPart(geminiProvider),
          ],
        );
      }),
    );
  }

  Widget _iconForSendMessage(void Function()? onPressed) {
    return IconButton(
      iconSize: 30,
      color: Colors.white,
      onPressed: onPressed,
      icon: const Icon(
        Icons.send,
        color: Colors.purple,
      ),
    );
  }

  Widget _messagesPart(GeminiProvider geminiProvider) {
    return Expanded(
      child: ListView.builder(
        controller: geminiProvider.scrollController,
        itemCount: geminiProvider.messages.length,
        itemBuilder: (context, index) {
          final message = geminiProvider.messages[index];
          return Message(
            isUser: message.isUser,
            message: message.message,
            date: DateFormat('HH:mm').format(message.date),
          );
        },
      ),
    );
  }

  Widget _sendPart(GeminiProvider geminiProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 15,
              child: CustomTextField(
                controlle: geminiProvider.userMessage,
                hintText: "Ask Gemini...",
              ),
            ),
            const Spacer(),
            _iconForSendMessage(
              () {
                geminiProvider.sendMessage(); // Your onPressed function
              },
            ),
          ],
        ),
      ),
    );
  }
}
