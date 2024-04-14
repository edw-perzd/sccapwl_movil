// Importación de paquetes necesarios
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sccapwl_movil/models/Users.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/services/firebase_auth.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

// Definición del widget SignUpScreen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key}); // Constructor

  @override
  State<SignUpScreen> createState() => _SignUpScreenState(); // Método para crear el estado del widget
}

// Estado del widget SignUpScreen
class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // Servicio de autenticación de Firebase

  bool isSigningUp = false; // Variable para controlar el estado del proceso de registro

  TextEditingController _emailController = TextEditingController(); // Controlador del campo de correo electrónico
  TextEditingController _usernameController = TextEditingController(); // Controlador del campo de nombre de usuario
  TextEditingController _passwordController = TextEditingController(); // Controlador del campo de contraseña

  // Método para construir la interfaz de usuario
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
                      style: AppTheme.lightTheme.textTheme.titleLarge), // Título de la pantalla
                ),
                CustomizedTextfield(
                  myController: _usernameController, // Campo de entrada de nombre de usuario
                  hintText: "Crea un nombre de usuario", 
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _emailController, // Campo de entrada de correo electrónico
                  hintText: "Ingresa un correo electrónico", 
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _passwordController, // Campo de entrada de contraseña
                  hintText: "Crea una contraseña", 
                  isPassword: true,
                ),
                CustomizedButton(
                  stateProcess: isSigningUp, // Estado del proceso de registro
                  buttonText: "Registrarme", // Texto del botón de registro
                  buttonColor: Color.fromARGB(255, 7, 106, 187), // Color del botón de registro
                  textColor: Color.fromARGB(255, 255, 255, 255), // Color del texto del botón de registro
                  onPressed: () {
                    _signUp(); // Método para realizar el registro de usuario
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Ya tienes una cuenta?", // Texto que pregunta si ya tienes una cuenta
                          style: AppTheme.lightTheme.textTheme.labelSmall),
                      TextButton(
                          onPressed: () {
                            final rutaSignUp =
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen(); // Botón para redirigir a la pantalla de inicio de sesión
                            });
                            Navigator.push(context, rutaSignUp);
                          },
                          child: Text('Inicia sesión', // Texto del botón de inicio de sesión
                              style: AppTheme.lightTheme.textTheme.labelLarge)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para realizar el registro de usuario
  void _signUp() async {
    setState(() {
      isSigningUp = true; // Cambia el estado a "registrando"
    });

    String username = _usernameController.text; // Obtiene el nombre de usuario ingresado
    String email = _emailController.text; // Obtiene el correo electrónico ingresado
    String password = _passwordController.text; // Obtiene la contraseña ingresada

    if (username != '') { // Verifica que se haya ingresado un nombre de usuario
      User? user = await _auth.signUpWithEmailAndPassword(email, password); // Registra al usuario con Firebase
      setState(() {
        isSigningUp = false; // Cambia el estado a "registro completado"
      });
      if (user != null) { // Si el registro fue exitoso
        registerUser(username, email, user.uid); // Registra al usuario en la base de datos
        Users userActual =
            Users(id: user.uid, nombreUsuario: username, email: email); // Crea un objeto de usuario
        showToast(message: 'Usuario registrado correctamente'); // Muestra un mensaje de éxito
        final home = MaterialPageRoute(builder: (context) {
          return HomeScreen(userActual: userActual); // Redirige a la pantalla principal
        });
        Navigator.push(context, home);
        showToast(message: 'Usuario creado correctamente'); // Muestra un mensaje de éxito
      } else { // Si el registro falló
        showToast(message: 'Ha ocurrido un error. Intenta de nuevo'); // Muestra un mensaje de error
        setState(() {
          isSigningUp = false; // Cambia el estado a "registro completado"
        });
      }
    } else { // Si no se ingresó un nombre de usuario
      showToast(message: 'Ingresa un nombre de mínimo 4 caracteres'); // Muestra un mensaje de error
      setState(() {
        isSigningUp = false; // Cambia el estado a "registro completado"
      });
    } 
  }
}
