import 'package:flutter/material.dart';

class CustomizedTextfield extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;

  const CustomizedTextfield({
    Key? key,
    required this.myController,
    this.hintText,
    this.isPassword,
  }) : super(key: key);

  @override
  _CustomizedTextfieldState createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        keyboardType: widget.isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: !widget.isPassword!,
        autocorrect: !widget.isPassword!,
        obscureText: widget.isPassword! ? _obscureText : false,
        controller: widget.myController,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 249, 246, 246),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 241, 236, 236),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: const Color.fromARGB(255, 250, 248, 248),
          filled: true,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
