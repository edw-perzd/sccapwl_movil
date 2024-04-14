// Importación de paquetes necesarios
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sccapwl_movil/models/Users.dart';
import 'package:sccapwl_movil/screens/forgot_password.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/screens/signup_screen.dart';
import 'package:sccapwl_movil/services/firebase_auth.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

// Definición del widget LoginScreen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Constructor

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Método para crear el estado del widget
}

// Estado del widget LoginScreen
class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // Instancia del servicio de autenticación de Firebase

  bool _isSigning = false; // Variable para controlar el estado del proceso de inicio de sesión

  final TextEditingController _emailController = TextEditingController(); // Controlador del campo de correo electrónico
  final TextEditingController _passwordController = TextEditingController(); // Controlador del campo de contraseña

  // Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Hola, bienvenido",
                      style: AppTheme.lightTheme.textTheme.titleLarge),
                ),
                CustomizedTextfield(
                  myController: _emailController, // Asigna el controlador al campo de correo electrónico
                  hintText: "Ingresa tu correo electronico",
                  isPassword: false,
                ),
                CustomizedTextfield(
                  myController: _passwordController, // Asigna el controlador al campo de contraseña
                  hintText: "Ingresa tu contraseña ",
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
                      child: Text("¿Olvidaste tu contraseña?", // Botón para redirigir a la pantalla de recuperación de contraseña
                          style: AppTheme.lightTheme.textTheme.labelMedium),
                    ),
                  ),
                ),
                CustomizedButton(
                  stateProcess: _isSigning, // Estado del proceso de inicio de sesión
                  buttonText: "Iniciar Sesión",
                  buttonColor: AppTheme.mainColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _signIn(); // Método para iniciar sesión
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
                        "Inicia sesión con",
                        style: AppTheme.lightTheme.textTheme.labelSmall,
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
                            onPressed: () {
                              _signInWithGoogle(); // Método para iniciar sesión con Google
                            },
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿No tienes cuenta?", // Botón para redirigir a la pantalla de registro
                          style: AppTheme.lightTheme.textTheme.labelSmall),
                      TextButton(
                          onPressed: () {
                            final rutaSignUp =
                                MaterialPageRoute(builder: (context) {
                              return const SignUpScreen();
                            });
                            Navigator.push(context, rutaSignUp);
                          },
                          child: Text('Registrate',
                              style:
                                  AppTheme.lightTheme.textTheme.labelLarge))
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

  // Método para iniciar sesión con correo electrónico y contraseña
  void _signIn() async {
    setState(() {
      _isSigning = true; // Cambia el estado a "iniciando sesión"
    });
    String email = _emailController.text; // Obtiene el correo electrónico ingresado por el usuario
    String password = _passwordController.text; // Obtiene la contraseña ingresada por el usuario

    User? user = await _auth.signInWithEmailAndPassword(email, password); // Inicia sesión utilizando el servicio de autenticación de Firebase

    setState(() {
      _isSigning = false; // Cambia el estado a "sesión iniciada"
    });
    if (user != null) {
      Users userActual = Users(id: user.uid, email: email); // Crea un objeto de usuario con la información proporcionada
      showToast(message: 'Se inició sesión correctamente'); // Muestra un mensaje de éxito
      final home = MaterialPageRoute(builder: (context) {
        return HomeScreen(userActual: userActual); // Redirige a la pantalla principal
      });
      Navigator.push(context, home);
    } else {
      showToast(message: 'Hubo un problema al iniciar sesión'); // Muestra un mensaje de error si no se pudo iniciar sesión
    }
  }

  // Método para iniciar sesión con Google
  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(); // Instancia de GoogleSignIn

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn(); // Inicia sesión con Google

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await FirebaseAuth.instance.signInWithCredential(credential); // Inicia sesión con las credenciales de Google

        User? user = FirebaseAuth.instance.currentUser; // Obtiene el usuario actual

        registerUser(user!.email, user.email, user.uid); // Registra al usuario en la base de datos
        Users userActual =
            Users(id: user.uid, nombreUsuario: user.email, email: user.email!);

        final home = MaterialPageRoute(builder: (context) {
          return HomeScreen(userActual: userActual); // Redirige a la pantalla principal
        });
        Navigator.push(context, home);
      }
    } catch (e) {
      showToast(message: 'Ha ocurrido un problema'); // Muestra un mensaje de error si no se pudo iniciar sesión con Google
    }
  }
}
