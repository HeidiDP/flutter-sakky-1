import 'package:chat/screens/auth.dart';
import 'package:chat/screens/chat.dart';
import 'package:chat/screens/rt_stream.dart';
import 'package:chat/screens/rt_test.dart';
import 'package:chat/screens/rt_test2.dart';
import 'package:chat/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 100, 20, 211),
          ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const SplashScreen();
        }

        if(snapshot.hasData){
          //return const RtTest2Screen();
          return const ChatScreen();
          //return const RtTestScreen();
          //return const RtStreamScreen();
        }
        return const AuthScreen();
      }),
    );
  }
}