import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sccapwl_movil/screens/forgot_password.dart';
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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Hola, bienvenido", 
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                )),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
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
              buttonColor: const Color.fromARGB(255, 7, 106, 187),
              textColor: Colors.white,
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
                    width: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.grey,
                  ),
                  const Text("Inicia sesión con"),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.18,
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
            const SizedBox(
              height: 140,
            ),
              const Padding(
                padding: EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes cuenta?",
                    style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 15,
                    )),
                    Text("   Registrate",
                    style: TextStyle(
                      color: Color.fromARGB(255, 37, 131, 220),
                      fontSize: 15,
                    )),
                  ],
                ),
              )
            ],
          ),
          )
        )
      ),
    );
  }
}