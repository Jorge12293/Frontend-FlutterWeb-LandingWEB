import 'package:flutter/material.dart';
import 'package:landing/providers/page_provider.dart';
import 'package:landing/router/router.dart';
import 'package:landing/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => PageProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/about',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
