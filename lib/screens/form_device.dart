import 'package:flutter/material.dart';
import 'package:sccapwl_movil/models/Users.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';

class FormDevice extends StatefulWidget {
  final Users userActual;
  const FormDevice({super.key, required this.userActual});

  @override
  State<FormDevice> createState() => _FormDeviceState();
}

class _FormDeviceState extends State<FormDevice> {
  final _formKey = GlobalKey<FormState>();
  String _deviceName = '';
  String _deviceCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar dispositivo'),
        backgroundColor: const Color.fromARGB(
            255, 25, 103, 219), // Color de fondo de la barra de la aplicación
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
                  labelText: 'Ingresa un nombre para el dispositivo',
                  labelStyle: TextStyle(
                      color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue[
                            900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese un nombre para el dispositivo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _deviceName = value!;
                },
              ),
              const SizedBox(height: 10), // Espacio entre los campos
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ingresa el código del dispositivo',
                  labelStyle: TextStyle(
                      color: Colors.blue[900]), // Color del texto del label
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue[
                            900]!), // Color del borde cuando no está enfocado
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .blueAccent), // Color del borde cuando está enfocado
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el código del dispositivo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _deviceCode = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print('Nombre del Depósito: $_deviceName');
                    print('Altura: $_deviceCode');

                    setDevice(_deviceCode, _deviceName, widget.userActual.id);
                    final rutaDevices = MaterialPageRoute(builder: (context) {
                      return DevicesScreen(userActual: widget.userActual);
                    });
                    Navigator.push(context, rutaDevices);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 38, 113, 225), // Color de fondo del botón
                ),
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                      color: Colors.white), // Color del texto del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
