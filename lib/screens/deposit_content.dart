import 'package:flutter/material.dart';

class DepositContent extends StatefulWidget {
  const DepositContent({super.key});


  @override
  State<DepositContent> createState() => _DepositContentState();
}

class _DepositContentState extends State<DepositContent> {
  final _formKey = GlobalKey<FormState>();
  String _depositName = '';
  double _height = 0.0;
  String _depositType = '';
  double _width = 0.0;
  double _length = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depósito'),
        backgroundColor: const Color.fromARGB(255, 25, 103, 219), // Color de fondo de la barra de la aplicación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre del Depósito',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un nombre para el depósito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _depositName = value!;
                },
              ),
              SizedBox(height: 10), // Espacio entre los campos
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese la altura del depósito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _height = double.parse(value!);
                },
              ),
              SizedBox(height: 10), // Espacio entre los campos
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tipo del Depósito',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el tipo del depósito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _depositType = value!;
                },
              ),
              SizedBox(height: 10), // Espacio entre los campos
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ancho (cm)',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el ancho del depósito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _width = double.parse(value!);
                },
              ),
              SizedBox(height: 10), // Espacio entre los campos
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Largo (cm)',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el largo del depósito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _length = double.parse(value!);
                },
              ),
              SizedBox(height: 20), // Espacio entre el botón y los campos
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print('Nombre del Depósito: $_depositName');
                    print('Altura: $_height');
                    print('Tipo del Depósito: $_depositType');
                    print('Ancho: $_width');
                    print('Largo: $_length');
                  }
                },
                child: Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white), // Color del texto del botón
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 38, 113, 225), // Color de fondo del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
