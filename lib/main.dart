// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jci/splaysh.dart';
import 'package:jci/units/notifire.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  // await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(provider());
}

class provider extends StatelessWidget {
  const provider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
