import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gpti/Features/genrateImage/presention/views/widgets/roundedContainerWithIcon.dart';

class ViewGeneratedImage extends StatelessWidget {
  final Uint8List image;
  const ViewGeneratedImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            _theImage(),
            const SizedBox(
              height: 50,
            ),
            _buttons(context),
          ]),
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedContainerWithIcon(
          icon: Icons.home,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const RoundedContainerWithIcon(icon: Icons.save_alt_outlined),
        const RoundedContainerWithIcon(icon: Icons.share),
      ],
    );
  }

  Widget _theImage() {
    return Container(
      width: 340,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.memory(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
