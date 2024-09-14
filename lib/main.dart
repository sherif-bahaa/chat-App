
import 'package:chat_app11/firebase_options.dart';
import 'package:chat_app11/views/chat_page.dart';
import 'package:chat_app11/views/login_view.dart';
import 'package:chat_app11/views/regestr_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      routes:{ 
        'RegestrPage':(context)=> RegestrPage(),
        'LoginView':(context)=> LoginView(),
        ChatPage.id: (context)=>ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginView",
    );
  }
}
/*
flutter clean
flutter pub get
flutter pub upgrade

flutter pub get
com.example.chat_app11
*/
