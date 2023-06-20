import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallo_app/constants/constant_colors.dart';
import 'package:vallo_app/models/user_manager.dart';
import 'package:vallo_app/screens/base/base_screen.dart';
import 'package:vallo_app/screens/login/login_screen.dart';
import 'package:vallo_app/screens/singup/singup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserManager>(
          create: (_) => UserManager(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: kPrimaryColor,
        ),
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SingUpScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => const BaseScreen(),
              );
          }
        },
        debugShowCheckedModeBanner: false,
        home: SingUpScreen(),
      ),
    );
  }
}
