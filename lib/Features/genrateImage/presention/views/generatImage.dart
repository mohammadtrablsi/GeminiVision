import 'package:flutter/widgets.dart';
import 'package:gpti/Features/bot/presention/mangers/geminiProvider.dart';
import 'package:gpti/Features/bot/presention/views/widgets/botBody.dart';
import 'package:gpti/Features/genrateImage/presention/mangers/stabilityAiProvider.dart';
import 'package:gpti/Features/genrateImage/presention/views/widgets/generateImageBody.dart';
import 'package:provider/provider.dart';

class GenerateImageScreen extends StatelessWidget {
  const GenerateImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StabilityAiProvider(),
      child: const GenerateImageBody(),
    );
  }
}
