import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_fresh/LoginPage/RegistryPage.dart';
import 'package:provider/provider.dart';
import 'LoginPage/LogPage.dart';
import 'MainPage/MainPage.dart';
import 'Provaidor/My Provaider.dart';
import 'Sections/Section1.dart';
import 'UserScrens/HomePage.dart';
import 'UserScrens/SectionsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MyProvaider(),
      ),
    ],
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors
            .pink[800], //Changing this will change the color of the TabBar
        accentColor: Colors.cyan[600],
      ),
      color: Colors.teal,
      title: 'Fresco',
      initialRoute: LogPage.RouteName,
      routes:<String , WidgetBuilder> {
        HomePage.RouteName : (_) => HomePage(),
        LogPage.RouteName : (_)=> LogPage(),
        RegistryPage.RouteName : (_)=> RegistryPage(),
      },
    );
  }
}
