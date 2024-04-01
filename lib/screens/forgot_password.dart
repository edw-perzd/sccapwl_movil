import 'package:flutter/material.dart';
import 'package:sccapwl_movil/widgets/customized_button.dart';
import 'package:sccapwl_movil/widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword ({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 37, 123, 203), width: 1),
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
                  child: Text("¿Has olvidado tu contraseña?", 
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 10, 10), 
                    fontSize: 30, 
                    // fontWeight: FontWeight.bold,
                  )),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("No te preocupes, nos pasa a todos. Le enviaremos un enlace para restablecer su contraseña",
              style: TextStyle(
                color: Color.fromARGB(255, 179, 177, 177),
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              )),
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Introduce tu correo",
              isPassword: false,
            ),
            CustomizedButton(
              buttonText: "Enviar código",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
                  padding: const EdgeInsets.fromLTRB(68, 8, 8, 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Recordar contraseña",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: const Text("  Iniciar Sesión",
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
    ));
  }
}