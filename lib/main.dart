import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/Authentication/LoginViewModel.dart';
import 'package:flutter_project/Authentication/Onboarding.dart';
import 'package:flutter_project/Authentication/SingUpViewmodel.dart';
import 'package:flutter_project/smartphonesList/ProductsScreen.dart';
import 'package:provider/provider.dart';
import 'Navigation/Navgation.dart';
import 'Authentication/Onboarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
            ChangeNotifierProvider(create: (_) => SignUpViewModel())

          ],
          child: MaterialApp(
            initialRoute: '/',
            routes: {
              '/':(context) => Onboarding(),
              '/Home': (context) => NavigatorMain(),

            },
          ),
        ),
    );
  }
}
