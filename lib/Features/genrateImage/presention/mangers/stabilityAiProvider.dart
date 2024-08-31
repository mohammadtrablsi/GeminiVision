import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpti/Features/genrateImage/presention/views/viewGeneratedImage.dart';
import 'package:gpti/core/utils/app_router.dart';
import 'package:gpti/core/utils/functions/appToast.dart';
import 'package:http/http.dart' as http;

class StabilityAiProvider with ChangeNotifier {
  final textController = TextEditingController();

  bool isLoading = false;
  Future<dynamic> convertTextToImage(
    String prompt,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();
    Uint8List imageData = Uint8List(0);

    const baseUrl = 'https://api.stability.ai';
    final url = Uri.parse(
        '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-1/text-to-image');

    // Make the HTTP POST request to the Stability Platform API
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            //add ypur secreat key here
            'Bearer put you token here',
        'Accept': 'image/png',
      },
      body: jsonEncode({
        'cfg_scale': 15,
        'clip_guidance_preset': 'FAST_BLUE',
        'height': 512,
        'width': 512,
        'samples': 1,
        'steps': 150,
        'seed': 0,
        'style_preset': "3d-model",
        'text_prompts': [
          {
            'text': prompt,
            'weight': 1,
          }
        ],
      }),
    );

    if (response.statusCode == 200) {
      try {
        imageData = (response.bodyBytes);
        isLoading = false;
        notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewGeneratedImage(image: imageData),
            ));
        // AppRouter.router
        //               .push("${AppRouter.kViewGeneratedImage}?image=$imageData");
        return response.bodyBytes;
      } on Exception {
        isLoading = false;
        notifyListeners();
        return appToast(context, 'Failed to generate image');
      }
    } else {
      isLoading = false;
      notifyListeners();
      return appToast(context, 'Failed to generate image');
    }
  }
}
