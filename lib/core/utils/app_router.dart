import 'package:go_router/go_router.dart';
import 'package:gpti/Features/bot/presention/views/bot.dart';
import 'package:gpti/Features/choosePart.dart';
import 'package:gpti/Features/genrateImage/presention/views/generatImage.dart';


abstract class AppRouter {
  static const kViewGeneratedImage = '/viewGeneratedImage';
  static const kGeneratedImage = '/generatImage';
  static const kBot = '/bot';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ChoosePart(),
      ),
        GoRoute(
        path: kGeneratedImage,
        builder: (context, state) {
          return const GenerateImageScreen();
          }
      ),
      GoRoute(
        path: kBot,
        builder: (context, state) {
          return const Bot();
          }
      ),
      // GoRoute(
      //   path: kViewGeneratedImage,
      //   builder: (context, state) {
      //     final image = state.queryParams['image'];
      //     return ViewGeneratedImage(image:image ,);
      //     }
      // ),
    ],
  );
}
