import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sccapwl_movil/models/Users.dart';
import 'package:sccapwl_movil/screens/deposit_content.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

class TanksScreen extends StatefulWidget {
  final Users userActual;
  const TanksScreen({super.key, required this.userActual});

  @override
  State<TanksScreen> createState() => _TanksScreenState();
}

class _TanksScreenState extends State<TanksScreen> {
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
                        widget.userActual.nombreUsuario ??
                            widget.userActual.email,
                        style: AppTheme.lightTheme.textTheme.titleSmall,
                      ),
                      onTap: () {},
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
                        widget.userActual.deleteUser();
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
          title: Text(
            'Mis depósitos',
            style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final rutaAddTank = MaterialPageRoute(builder: (context) {
                    return DepositContent(
                      userActual: widget.userActual,
                    );
                  });
                  Navigator.push(context, rutaAddTank);
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
              future: getTanksById(widget.userActual.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const IconTheme(
                                data: IconThemeData(
                                    color: AppTheme.mediumColor, size: 25),
                                child: Icon(Icons.water)),
                            title: Text(
                              snapshot.data[index]['nombre_deposito'],
                              style: AppTheme.lightTheme.textTheme.bodyLarge,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Altura: ${snapshot.data[index]['altura_deposito']}',
                                  style:
                                      AppTheme.lightTheme.textTheme.bodySmall,
                                ),
                                Text(
                                  'Ancho: ${snapshot.data[index]['ancho_deposito']}',
                                  style:
                                      AppTheme.lightTheme.textTheme.bodySmall,
                                ),
                                Text(
                                  'Largo: ${snapshot.data[index]['largo_deposito']}',
                                  style:
                                      AppTheme.lightTheme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
