import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';

class ChoosePart extends StatelessWidget {
  const ChoosePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textsPart(),
          _Item(Colors.purple, "Gemini", () {
            GoRouter.of(context).push(AppRouter.kBot);
          }),
          SizedBox(
            height: 1.h,
          ),
          _Item(Colors.blueGrey, "stabilityAi", () {
            GoRouter.of(context).push(AppRouter.kGeneratedImage);
          }),
        ],
      ),
    );
  }

  Widget _textsPart() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, end: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Get Started",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
          ),
          Text(
            "enjoy with alot of ai models",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget _Item(Color color, String text, void Function()? onTap) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 3.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(18.sp)),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_right,
                  size: 20.sp,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
