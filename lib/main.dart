import 'package:all_bluetooth/all_bluetooth.dart';
import 'package:flutter/material.dart';
// import 'package:sccapwl_movil/main_app.dart';

// Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:sccapwl_movil/screens/connect_bluetooth.dart';
import 'package:sccapwl_movil/screens/welcome_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

final allBluetooth = AllBluetooth();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<Object>(
          stream: allBluetooth.listenForConnection,
          builder: (context, snapshot) {
            final result = snapshot.data;
            print(result);
            return const WelcomeScreen();
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
