import 'package:flutter/material.dart';
import 'package:sccapwl_movil/screens/connect_bluetooth.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/screens/tanks_screen.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
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
                  leading: const IconTheme(
                      data:
                          IconThemeData(color: AppTheme.mediumColor, size: 25),
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
                  selected: true,
                  selectedTileColor: AppTheme.mediumColorTrans,
                  // selectedColor: AppTheme.mediumColor,
                  leading: const IconTheme(
                      data:
                          IconThemeData(color: AppTheme.mediumColor, size: 25),
                      child: Icon(Icons.settings_remote)),
                  title: Text(
                    'Mis dispositivos',
                    style: AppTheme.lightTheme.textTheme.bodyMedium,
                  ),
                  onTap: () {
                    final rutaDevices = MaterialPageRoute(builder: (context) {
                      return const DevicesScreen();
                    });
                    Navigator.push(context, rutaDevices);
                  },
                ),
                ListTile(
                  leading: const IconTheme(
                      data:
                          IconThemeData(color: AppTheme.mediumColor, size: 25),
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
                      data:
                          IconThemeData(color: AppTheme.mediumColor, size: 25),
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
                      data:
                          IconThemeData(color: AppTheme.mediumColor, size: 25),
                      child: Icon(Icons.exit_to_app)),
                  title: Text(
                    'Cerrar sesión',
                    style: AppTheme.lightTheme.textTheme.bodyMedium,
                  ),
                  onTap: () {
                    final rutaTanks = MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    });
                    Navigator.push(context, rutaTanks);
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
            )),
      ),
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        centerTitle: true,
        title: Text(
          'Mis dispositivos',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final rutaAddDevice = MaterialPageRoute(builder: (context) {
                  return const ConnectBluetooth();
                });
                Navigator.push(context, rutaAddDevice);
              },
              icon: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.add),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: getDevices(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: IconTheme(
                              data: AppTheme.lightTheme.iconTheme,
                              child: const IconTheme(
                                  data: IconThemeData(
                                      color: AppTheme.mediumColor, size: 25),
                                  child: Icon(Icons.settings_remote))),
                          title: Text(
                            snapshot.data[index]['nombre_dispositivo'],
                            style: AppTheme.lightTheme.textTheme.bodyLarge,
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                'Estado: ',
                                style: AppTheme.lightTheme.textTheme.bodySmall,
                              ),
                              Text(
                                snapshot.data?[index]['estado_dispositivo'] ==
                                        true
                                    ? 'Encendido'
                                    : 'Apagado',
                                style: snapshot.data[index]
                                            ['estado_dispositivo'] ==
                                        true
                                    ? const TextStyle(color: Colors.green)
                                    : const TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  // children: [
                  //   Container(
                  //     // margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  //     padding: const EdgeInsets.all(10),
                  //     // decoration: BoxDecoration(
                  //     //     color: AppTheme.backColor,
                  //     //     borderRadius: BorderRadius.circular(10)),
                  //     child: ListTile(
                  //       leading: IconTheme(
                  //           data: AppTheme.lightTheme.iconTheme,
                  //           child: const Icon(Icons.settings_remote)),
                  //       title: Text(
                  //         'Dispositivo 1',
                  //         style: AppTheme.lightTheme.textTheme.headlineMedium,
                  //       ),
                  //       subtitle: Row(
                  //         children: [
                  //           Text(
                  //             'Estado: ',
                  //             style: AppTheme.lightTheme.textTheme.bodySmall,
                  //           ),
                  //           const Text(
                  //             'Encendido',
                  //             style: TextStyle(color: Colors.green),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   const Divider(),
                  //   Container(
                  //     // margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  //     padding: const EdgeInsets.all(10),
                  //     // decoration: BoxDecoration(
                  //     //     color: AppTheme.backColor,
                  //     //     borderRadius: BorderRadius.circular(10)),
                  //     child: ListTile(
                  //       leading: IconTheme(
                  //           data: AppTheme.lightTheme.iconTheme,
                  //           child: const Icon(Icons.settings_remote)),
                  //       title: Text(
                  //         'Dispositivo 2',
                  //         style: AppTheme.lightTheme.textTheme.headlineMedium,
                  //       ),
                  //       subtitle: Row(
                  //         children: [
                  //           Text(
                  //             'Estado: ',
                  //             style: AppTheme.lightTheme.textTheme.bodySmall,
                  //           ),
                  //           const Text(
                  //             'Apagado',
                  //             style: TextStyle(color: Colors.red),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   const Divider(),
                  //   Container(
                  //     // margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  //     padding: const EdgeInsets.all(10),
                  //     // decoration: BoxDecoration(
                  //     //     color: AppTheme.backColor,
                  //     //     borderRadius: BorderRadius.circular(10)),
                  //     child: ListTile(
                  //       leading: IconTheme(
                  //           data: AppTheme.lightTheme.iconTheme,
                  //           child: const Icon(Icons.settings_remote)),
                  //       title: Text(
                  //         'Dispositivo 3',
                  //         style: AppTheme.lightTheme.textTheme.headlineMedium,
                  //       ),
                  //       subtitle: Row(
                  //         children: [
                  //           Text(
                  //             'Estado: ',
                  //             style: AppTheme.lightTheme.textTheme.bodySmall,
                  //           ),
                  //           const Text(
                  //             'Encendido',
                  //             style: TextStyle(color: Colors.green),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
