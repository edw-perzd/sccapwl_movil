import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              CustomizedTextfield(
                myController: _confirmPasswordController,
                hintText: "Confirmar contraseña",
                isPassword: true,
              ),
              CustomizedButton(
                buttonText: "Registrarme",
                buttonColor: Color.fromARGB(255, 7, 106, 187),
                textColor: Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.16,
                      color: Colors.grey,
                    ),
                    Text(
                      "Registrate con",
                      style: AppTheme.lightTheme.textTheme.labelMedium,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            color: Color.fromARGB(255, 74, 89, 102),
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
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
}
