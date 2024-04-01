import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sccapwl_movil/screens/forgot_password.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_sharp),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Hola, bienvenido",
                          style: AppTheme.lightTheme.textTheme.headlineLarge),
                    ),
                    CustomizedTextfield(
                      myController: _emailController,
                      hintText: "Ingresa tu email",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _passwordController,
                      hintText: "Ingresa tu contraseña",
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: const Text("¿Olvidaste tu contraseña?",
                              style: TextStyle(
                                color: Color(0xff6A707C),
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ),
                    CustomizedButton(
                      buttonText: "Iniciar Sesión",
                      buttonColor: AppTheme.mainColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.15,
                            color: Colors.grey,
                          ),
                          Text(
                            "Inicia sesión con",
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
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
                    const SizedBox(
                      height: 140,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿No tienes cuenta?",
                              style: AppTheme.lightTheme.textTheme.bodySmall),
                          Text("   Registrate",
                              style: AppTheme.lightTheme.textTheme.bodyLarge),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
