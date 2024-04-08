import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/services/firebase_auth.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool isSigningUp = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Registrate para continuar",
                    style: AppTheme.lightTheme.textTheme.titleLarge),
              ),
              CustomizedTextfield(
                myController: _usernameController,
                hintText: "Crea un nombre de usuario",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Ingresa un correo electrónico",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Crea una contraseña",
                isPassword: true,
              ),
              CustomizedButton(
                stateProcess: isSigningUp,
                buttonText: "Registrarme",
                buttonColor: Color.fromARGB(255, 7, 106, 187),
                textColor: Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  _signUp();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿Ya tienes una cuenta?",
                        style: AppTheme.lightTheme.textTheme.labelSmall),
                    TextButton(
                        onPressed: () {
                          final rutaSignUp =
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          });
                          Navigator.push(context, rutaSignUp);
                        },
                        child: Text('Inicia sesión',
                            style: AppTheme.lightTheme.textTheme.labelLarge)),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: 'Usuario registrado correctamente');
      final home = MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      });
      Navigator.push(context, home);
      showToast(message: 'Usuario creado correctamente');
    }
  }
}
