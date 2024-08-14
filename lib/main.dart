import 'package:flutter/material.dart';
import 'package:patterns_getx/pages/main_page.dart';
import 'package:patterns_getx/pages/splash_page.dart';
import 'package:patterns_getx/pages/starter_page.dart';
import 'package:patterns_getx/service/di_service.dart';

void main()async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StarterPage(),
      // initialBinding: BindService(),
      //   getPages: [
      //     GetPage(
      //       name: MainPage.id,
      //       page: ()=> const MainPage(),
      //       binding: BindService(),
      //
      //     )
      //   ],
    );
  }
}
