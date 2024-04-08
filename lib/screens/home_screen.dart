import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/screens/tanks_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/toast.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
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
                        'Yahir Durán',
                        style: AppTheme.lightTheme.textTheme.titleSmall,
                      ),
                      onTap: () {},
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children:z [
                    //     IconTheme(
                    //       data: AppTheme.lightTheme.iconTheme,
                    //       child: const Icon(Icons.person),
                    //     ),
                    //     Text(
                    //       'Fulanito de tal',
                    //       style: AppTheme.lightTheme.textTheme.headlineLarge,
                    //     )
                    //   ],
                    // ),
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
                          return const HomeScreen();
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
                          return const DevicesScreen();
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
                          return const TanksScreen();
                        });
                        Navigator.push(context, rutaTanks);
                      },
                    ),
                    ListTile(
                      leading: const IconTheme(
                          data: IconThemeData(
                              color: AppTheme.mediumColor, size: 25),
                          child: Icon(Icons.receipt)),
                      title: Text(
                        'Informes',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      onTap: () {
                        null;
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
          title: DropdownButton(
            value: dropdownValue,
            icon: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.keyboard_arrow_down)),
            dropdownColor: AppTheme.mediumColor,
            borderRadius: BorderRadius.circular(10),
            items: [
              DropdownMenuItem(
                  value: 1,
                  child: Text(
                    'Dispositivo 1',
                    style: AppTheme.lightTheme.textTheme.headlineSmall,
                  )),
              DropdownMenuItem(
                  value: 2,
                  child: Text(
                    'Dispositivo 2',
                    style: AppTheme.lightTheme.textTheme.headlineSmall,
                  )),
              DropdownMenuItem(
                  value: 3,
                  child: Text(
                    'Dispositivo 3',
                    style: AppTheme.lightTheme.textTheme.headlineSmall,
                  )),
            ],
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ),
          // leading: IconButton(
          //   color: AppTheme.darkColor,
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {
          //     null;
          //   },
          // ),
        ),
        body: ListView(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.35,
                padding: const EdgeInsets.only(top: 35, left: 40, right: 40),
                // color: AppTheme.mainColor,
                decoration: const BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text('80%',
                                style: AppTheme
                                    .lightTheme.textTheme.headlineLarge),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              height: 50,
                              width: 2,
                              color: Colors.white,
                            ),
                            Column(
                              children: [
                                Text(
                                  '250 L',
                                  style: AppTheme
                                      .lightTheme.textTheme.headlineMedium,
                                ),
                                Text(
                                  '1000 L',
                                  style: AppTheme
                                      .lightTheme.textTheme.headlineSmall,
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
                                color: AppTheme.backColor, fontSize: 18)),
                        Text('Buena',
                            style: AppTheme.lightTheme.textTheme.headlineSmall),
                        IconTheme(
                            data: AppTheme.lightTheme.iconTheme,
                            child: const Icon(Icons.check)),
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
                          const Column(
                            children: [
                              Text('Última actualización: ',
                                  style: TextStyle(
                                      color: AppTheme.backColor, fontSize: 14)),
                              Text('2024/04/02 - 05:33 p.m.',
                                  style: TextStyle(
                                      color: AppTheme.backColor, fontSize: 14)),
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
                              child: const Icon(WeatherIcons.thermometer)),
                          const Text('Temperatura',
                              style: TextStyle(
                                color: AppTheme.backColor,
                                fontSize: 14,
                              )),
                          const Row(
                            children: [
                              Text('38',
                                  style: TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                  )),
                              Text(' °c',
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
                          const Text('7.0',
                              style: TextStyle(
                                color: AppTheme.backColor,
                                fontSize: 14,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          IconTheme(
                              data: AppTheme.lightTheme.iconTheme,
                              child: const Icon(Icons.local_drink)),
                          const Text('Turbidez',
                              style: TextStyle(
                                color: AppTheme.backColor,
                                fontSize: 14,
                              )),
                          const Row(
                            children: [
                              Text('3080',
                                  style: TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                  )),
                              Text(' NTU',
                                  style: TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                  )),
                            ],
                          )
                        ],
                      )
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
                          const Row(
                            children: [
                              Text('500',
                                  style: TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                  )),
                              Text(' PPM',
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
                          const Row(
                            children: [
                              Text('250',
                                  style: TextStyle(
                                    color: AppTheme.backColor,
                                    fontSize: 14,
                                  )),
                              Text(' L',
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Estado del dispositivo: ',
                      style: TextStyle(
                        color: AppTheme.backColor,
                        fontSize: 14,
                      )),
                  const Text('Encendido',
                      style: TextStyle(
                        color: AppTheme.backColor,
                        fontSize: 14,
                      )),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      null;
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
            )
          ],
        ));
  }
}
