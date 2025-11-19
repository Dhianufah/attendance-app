import 'package:attendance_app/wrapper/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBATiThAtamQSxl4vMYy-mu9X0xTsAT6UY",
      appId: "1:373958418737:android:f8da3a04fa1d909faf5010",
      messagingSenderId: "373958418737",
      projectId: "attendance-app-fa233",
    )
  );
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0
        )
      ),
      home: AuthWrapper(),
    );
  }
}