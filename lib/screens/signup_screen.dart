import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen ({super.key});

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
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 37, 123, 203), width: 1),
                      borderRadius: BorderRadius.circular(10),
                
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Registrate \npara continuar", 
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10), 
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                  )),
                ),
                CustomizedTextfield(
                  myController: _usernameController, 
                  hintText: "Nombre de usuario", 
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _emailController, 
                  hintText: "Correo electrónico",  
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _passwordController, 
                  hintText: "Contraseña", 
                  isPassword: true,
                ),
                CustomizedTextfield(
                  myController: _confirmPasswordController, 
                  hintText: "Confirma tu contraseña", 
                  isPassword: true,
                ),
                CustomizedButton(
                buttonText: "Registrar",
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
                    const Text("Registrate con", style: TextStyle(color: Colors.grey),),
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
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: const Color.fromARGB(255, 74, 89, 102),
                        ),
                        onPressed: () {},
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
                Padding(
                  padding: EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿Ya tienes una cuenta?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, 
                              MaterialPageRoute(builder: (_) => const LoginScreen()));
                        },
                        child: const Text("   Inicia Sesión",
                        style: TextStyle(
                          color: Color.fromARGB(255, 37, 131, 220),
                          fontSize: 15,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}