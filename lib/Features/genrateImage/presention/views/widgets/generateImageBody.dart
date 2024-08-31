import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpti/Features/genrateImage/presention/mangers/stabilityAiProvider.dart';
import 'package:gpti/core/utils/assets.dart';
import 'package:gpti/core/utils/classes/customTextField.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GenerateImageBody extends StatelessWidget {
  const GenerateImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final stabilityAiProvider = Provider.of<StabilityAiProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _image(),
                Padding(
                  padding: EdgeInsetsDirectional.only(top:5.h),
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size:20.sp,)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  _textField(stabilityAiProvider),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<StabilityAiProvider>(
                      builder: (context, prov, child) {
                    return _button(stabilityAiProvider, context);
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(StabilityAiProvider stabilityAiProvider) {
    return SizedBox(
      height: 55,
      child: CustomTextField(
        controlle: stabilityAiProvider.textController,
        hintText: "generate your image...",
      ),
    );
  }

  Widget _button(
      StabilityAiProvider stabilityAiProvider, BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF9DB2BF),
        ),
        onPressed: () {
          stabilityAiProvider.convertTextToImage(
              stabilityAiProvider.textController.text, context);
          stabilityAiProvider.isLoading = true;

          // setState(() {});
        },
        child: stabilityAiProvider.isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(color: Colors.black))
            : const Text('Generate Image',
                style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _image() {
    return Container(
        width: double.infinity,
        height: 40.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.generate2Image),
                fit: BoxFit.cover)));
  }
}
