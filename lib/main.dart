import 'package:flutter/material.dart';
import 'package:gpti/core/utils/app_router.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PowerOfTask());
}

class PowerOfTask extends StatelessWidget {
  const PowerOfTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
