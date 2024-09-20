import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/Firebase_options.dart';
import 'package:you_tube_clone/channel/my_channel/pages/my_channel_screen.dart';
import 'package:you_tube_clone/cores/screens/loader.dart';
import 'package:you_tube_clone/features/auth/pages/login_page.dart';
import 'package:you_tube_clone/features/auth/pages/username_page.dart';
import 'package:you_tube_clone/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, authSnapshot) {
          if (authSnapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }

          if (!authSnapshot.hasData) {
            return LoginPage();
          }

          final user = FirebaseAuth.instance.currentUser;

          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              // Handle the case where the snapshot is null or no data
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loader();
              }

              // If user data does not exist
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return UsernamePage(
                  displayName: user.displayName ?? 'Guest', // Handle null with default values
                  profilePic: user.photoURL ?? '',          // Default or empty string for null
                  email: user.email ?? 'No Email',          // Default value if null
                );
              }

              // Return your main app screen if the user data exists
              return MyChannelScreen(); // Replace with your actual screen
            },
          );
        },
      ),
    );
  }
}
