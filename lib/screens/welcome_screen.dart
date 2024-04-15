import 'package:flutter/material.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/screens/signup_screen.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 140,
              width: 300,
              child: Image(
                  image: AssetImage("assets/Logo.jpg"), fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomizedButton(
              stateProcess: false,
              buttonText: "Iniciar Sesión",
              buttonColor: const Color.fromARGB(255, 7, 106, 187),
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            CustomizedButton(
              stateProcess: false,
              buttonText: "Registrate",
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Continua...",
                  style: TextStyle(color: Colors.blue, fontSize: 25)),
            )
          ],
        ),
      ),
    );
  }
}
