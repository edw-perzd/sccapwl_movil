import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sccapwl_movil/models/Users.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/screens/edit_profile.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/screens/tanks_screen.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/toast.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  final Users userActual;
  const HomeScreen({super.key, required this.userActual});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = '0';
  @override
  Widget build(BuildContext context) {
    widget.userActual.getUserData();
    return Scaffold(
        drawer: Drawer(
            child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: IconTheme(
                          data: AppTheme.lightTheme.iconTheme,
                          child: const IconTheme(
                              data: IconThemeData(
                                  color: AppTheme.darkColor, size: 25),
                              child: Icon(Icons.person))),
                      title: Text(
                        widget.userActual.nombreUsuario ??
                            widget.userActual.email,
                        style: AppTheme.lightTheme.textTheme.titleSmall,
                      ),
                      onTap: () {
                        final rutaProfile =
                            MaterialPageRoute(builder: (context) {
                          return EditProfile(userActual: widget.userActual);
                        });
                        Navigator.push(context, rutaProfile);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      selected: true,
                      selectedTileColor: AppTheme.mediumColorTrans,
                      // selectedColor: AppTheme.mediumColor,
                      leading: const IconTheme(
                          data: IconThemeData(
                              color: AppTheme.mediumColor, size: 25),
                          child: Icon(Icons.home)),
                      title: Text(
                        'Pantalla principal',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        final rutaHome = MaterialPageRoute(builder: (context) {
                          return HomeScreen(userActual: widget.userActual);
                        });
                        Navigator.push(context, rutaHome);
                      },
                    ),
                    ListTile(
                      leading: const IconTheme(
                          data: IconThemeData(
                              color: AppTheme.mediumColor, size: 25),
                          child: Icon(Icons.settings_remote)),
                      title: Text(
                        'Mis dispositivos',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        final rutaDevices =
                            MaterialPageRoute(builder: (context) {
                          return DevicesScreen(userActual: widget.userActual);
                        });
                        Navigator.push(context, rutaDevices);
                      },
                    ),
                    ListTile(
                      leading: const IconTheme(
                          data: IconThemeData(
                              color: AppTheme.mediumColor, size: 25),
                          child: Icon(Icons.invert_colors)),
                      title: Text(
                        'Mis depósitos',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        final rutaTanks = MaterialPageRoute(builder: (context) {
                          return TanksScreen(
                            userActual: widget.userActual,
                          );
                        });
                        Navigator.push(context, rutaTanks);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const IconTheme(
                          data: IconThemeData(
                              color: AppTheme.mediumColor, size: 25),
                          child: Icon(Icons.exit_to_app)),
                      title: Text(
                        'Cerrar sesión',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        final rutaTanks = MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        });
                        Navigator.push(context, rutaTanks);
                        showToast(message: 'Se cerró sesión');
                      },
                    ),
                    const Divider(),
                    ListTile(
                        leading: const IconTheme(
                            data: IconThemeData(
                                color: AppTheme.mediumColor, size: 25),
                            child: Icon(Icons.link)),
                        title: Text(
                          'Ir al sitio web',
                          style: AppTheme.lightTheme.textTheme.bodyMedium,
                        ),
                        onTap: () {
                          null;
                        })
                  ],
                ))),
        appBar: AppBar(
            backgroundColor: AppTheme.mainColor,
            centerTitle: true,
            title: StreamBuilder(
                stream: firebaseInstance
                    .collection('dispositivos')
                    .where('id_usuario', isEqualTo: widget.userActual.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  List<DropdownMenuItem> devicesItems = [];
                  if (!snapshot.hasData) {
                    devicesItems.add(DropdownMenuItem(
                        value: '0',
                        child: Text('Sin dispositivos vinculados',
                            style:
                                AppTheme.lightTheme.textTheme.headlineSmall)));
                  } else {
                    final devices = snapshot.data?.docs.reversed.toList();
                    devicesItems.add(DropdownMenuItem(
                        value: '0',
                        child: Text('Selecciona un dispositivo',
                            style:
                                AppTheme.lightTheme.textTheme.headlineSmall)));
                    for (var devices in devices!) {
                      devicesItems.add(DropdownMenuItem(
                          value: devices.id,
                          child: Text(devices['nombre_dispositivo'],
                              style: AppTheme
                                  .lightTheme.textTheme.headlineSmall)));
                    }
                  }
                  return DropdownButton(
                    icon: IconTheme(
                        data: AppTheme.lightTheme.iconTheme,
                        child: const Icon(Icons.keyboard_arrow_down)),
                    dropdownColor: AppTheme.mediumColor,
                    borderRadius: BorderRadius.circular(10),
                    items: devicesItems,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    value: dropdownValue,
                  );
                })),
        body: dropdownValue != '0'
            ? StreamBuilder(
                stream: firebaseInstance
                    .collection('depositos')
                    .where('id_dispositivo', isEqualTo: dropdownValue)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  String nombre_deposito = '';
                  double nivelTDS = 0.0;
                  double nivelTemp = 0.0;
                  double nivelpH = 0.0;
                  double cantAgua = 0.0;
                  bool estado = false;
                  String ultActual = '';

                  double alto = 0.0;
                  double largo = 0.0;
                  double ancho = 0.0;

                  double cantMax = 0.0;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text('Error al cargar los datos'),
                    );
                  }
                  final depositoData = snapshot.data!.docs.reversed.toList();
                  for (var docDeposito in depositoData) {
                    nombre_deposito = docDeposito['nombre_deposito'];
                    nivelTDS = double.parse(docDeposito['agua_contenida']
                            ['nivelTDS_agua']
                        .toStringAsFixed(2));
                    nivelTemp = double.parse(docDeposito['agua_contenida']
                            ['nivelTemp_agua']
                        .toStringAsFixed(2));
                    nivelpH = double.parse(docDeposito['agua_contenida']
                            ['nivelpH_agua']
                        .toStringAsFixed(2));
                    cantAgua = double.parse(docDeposito['agua_contenida']
                            ['cantidad_agua']
                        .toStringAsFixed(2));
                    estado = docDeposito['agua_contenida']['estado_agua'];
                    ultActual = docDeposito['agua_contenida']
                        ['ultimaActualizacion_agua'];
                    largo = double.parse(
                        docDeposito['largo_deposito'].toStringAsFixed(2));
                    alto = double.parse(
                        docDeposito['altura_deposito'].toStringAsFixed(2));
                    ancho = double.parse(
                        docDeposito['ancho_deposito'].toStringAsFixed(2));

                    cantMax = (largo * ancho * alto) * 0.001;
                  }
                  return ListView(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          padding: const EdgeInsets.only(
                              top: 35, left: 40, right: 40),
                          // color: AppTheme.mainColor,
                          decoration: const BoxDecoration(
                              color: AppTheme.mainColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text('${cantAgua * 100 / cantMax}%',
                                          style: AppTheme.lightTheme.textTheme
                                              .headlineLarge),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        height: 50,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '$cantAgua L',
                                            style: AppTheme.lightTheme.textTheme
                                                .headlineMedium,
                                          ),
                                          Text(
                                            'Aprox.',
                                            style: AppTheme.lightTheme.textTheme
                                                .headlineSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const CircularProgressIndicator(
                                    backgroundColor: AppTheme.backColor,
                                    color: AppTheme.mediumColor,
                                    strokeWidth: 40,
                                    value: 0.8,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                                height: MediaQuery.of(context).size.height / 13,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Calidad del agua: ',
                                      style: TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 18)),
                                  Text(estado ? 'Buena' : 'Mala',
                                      style: AppTheme
                                          .lightTheme.textTheme.headlineSmall),
                                  estado
                                      ? const IconTheme(
                                          data: IconThemeData(
                                              color: Colors.green),
                                          child: Icon(Icons.check))
                                      : const IconTheme(
                                          data:
                                              IconThemeData(color: Colors.red),
                                          child: Icon(Icons.close))
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconTheme(
                                        data: AppTheme.lightTheme.iconTheme,
                                        child: const Icon(Icons.refresh)),
                                    Column(
                                      children: [
                                        const Text('Última actualización: ',
                                            style: TextStyle(
                                                color: AppTheme.backColor,
                                                fontSize: 14)),
                                        Text(ultActual,
                                            style: const TextStyle(
                                                color: AppTheme.backColor,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        padding: const EdgeInsets.all(50),
                        margin: const EdgeInsets.only(
                            top: 50, left: 10, right: 10, bottom: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppTheme.mediumColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    IconTheme(
                                        data: AppTheme.lightTheme.iconTheme,
                                        child: const Icon(
                                            WeatherIcons.thermometer)),
                                    const Text('Temperatura',
                                        style: TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 14,
                                        )),
                                    Row(
                                      children: [
                                        Text('$nivelTemp',
                                            style: const TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                        const Text(' °c',
                                            style: TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconTheme(
                                        data: AppTheme.lightTheme.iconTheme,
                                        child: const Icon(Icons.science)),
                                    const Text('Nivel de pH',
                                        style: TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 14,
                                        )),
                                    Text('$nivelpH',
                                        style: const TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 14,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    IconTheme(
                                        data: AppTheme.lightTheme.iconTheme,
                                        child: const Icon(Icons.water_drop)),
                                    const Text('Nivel de TDS',
                                        style: TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 14,
                                        )),
                                    Row(
                                      children: [
                                        Text('$nivelTDS',
                                            style: const TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                        const Text(' PPM',
                                            style: TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconTheme(
                                        data: AppTheme.lightTheme.iconTheme,
                                        child: const Icon(Icons.water)),
                                    const Text('Cant. de agua',
                                        style: TextStyle(
                                          color: AppTheme.backColor,
                                          fontSize: 14,
                                        )),
                                    Row(
                                      children: [
                                        Text('$cantAgua',
                                            style: const TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                        const Text(' L aprox.',
                                            style: TextStyle(
                                              color: AppTheme.backColor,
                                              fontSize: 14,
                                            )),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, right: 30, bottom: 10),
                        decoration: BoxDecoration(
                            color: AppTheme.mainColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Midiendo ',
                                style: TextStyle(
                                  color: AppTheme.backColor,
                                  fontSize: 14,
                                )),
                            Text('$nombre_deposito...',
                                style: const TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                      )
                    ],
                  );
                },
              )
            : const Center(
                child: Text('Selecciona un dispositivo'),
              ));
  }
}
