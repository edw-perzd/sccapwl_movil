import 'package:flutter/material.dart';
import 'package:sccapwl_movil/models/Users.dart';

class EditProfile extends StatefulWidget {
  final Users userActual;
  const EditProfile({super.key, required this.userActual});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isObscurePassword = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  late TextEditingController _phoneController;
  late TextEditingController _FirstsureNameController;
  late TextEditingController _SecondsureNameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _phoneController = TextEditingController();
    _ageController = TextEditingController();
    _FirstsureNameController = TextEditingController();
    _SecondsureNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _FirstsureNameController.dispose();
    _SecondsureNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Nombres", "Demon", false, TextInputType.text),
              buildTextField(
                  "Apellido paterno", "Hernandez", false, TextInputType.text),
              buildTextField(
                  "Apellido materno", "Lopez", false, TextInputType.text),
              buildTextField("Edad", "17", false, TextInputType.number),
              buildTextField("Contraseña", "*********", true,
                  TextInputType.text, _passwordController),
              buildTextField("Correo", "demo@example", false,
                  TextInputType.emailAddress, _emailController),
              buildTextField("Numero telefonico", "276118....", false,
                  TextInputType.phone),
              const SizedBox(height: 30),
              const SizedBox(height: 30),
              buildTextField("Nombres", "Demon", false, TextInputType.text,
                  _usernameController),
              buildTextField("Apellido paterno", "Hernandez", false,
                  TextInputType.text, _FirstsureNameController),
              buildTextField("Apellido materno", "Lopez", false,
                  TextInputType.text, _SecondsureNameController),
              buildTextField(
                  "Edad", "17", false, TextInputType.number, _ageController),
              buildTextField("Contraseña", "*********", true,
                  TextInputType.text, _passwordController),
              buildTextField("Correo", "demo@example", false,
                  TextInputType.emailAddress, _emailController),
              buildTextField("Numero telefonico", "276118....", false,
                  TextInputType.phone, _phoneController),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('CANCELAR',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('GUARDAR',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextInputType keyboardType,
      [TextEditingController? controller]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: isPasswordTextField ? isObscurePassword : false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    })
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
