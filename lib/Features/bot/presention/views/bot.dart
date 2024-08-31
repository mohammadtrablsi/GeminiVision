import 'package:flutter/widgets.dart';
import 'package:gpti/Features/bot/presention/mangers/geminiProvider.dart';
import 'package:gpti/Features/bot/presention/views/widgets/botBody.dart';
import 'package:provider/provider.dart';

class Bot extends StatelessWidget {
  const Bot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GeminiProvider(),
      child: const BotBody(),
    );
  }
}
