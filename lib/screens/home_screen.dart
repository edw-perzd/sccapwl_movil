import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/screens/login_screen.dart';
import 'package:sccapwl_movil/screens/tanks_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';
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
                    child: const Icon(Icons.person),
                  ),
                  title: Text(
                    'Yahir Durán',
                    style: AppTheme.lightTheme.textTheme.headlineLarge,
                  ),
                  onTap: () {
                    null;
                  },
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.home),
                  ),
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.settings_remote),
                  ),
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.invert_colors),
                  ),
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.receipt),
                  ),
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.exit_to_app),
                  ),
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
                  leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.link),
                  ),
                  title: Text(
                    'Ir al sitio web',
                    style: AppTheme.lightTheme.textTheme.bodyMedium,
                  ),
                  onTap: () {
                    null;
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: DropdownButton(
            value: dropdownValue,
            icon: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.keyboard_arrow_down)),
            style: const TextStyle(color: AppTheme.darkColor),
            items: [
              DropdownMenuItem(
                  value: 1,
                  child: Text(
                    'Dispositivo 1',
                    style: AppTheme.lightTheme.textTheme.headlineMedium,
                  )),
              DropdownMenuItem(
                  value: 2,
                  child: Text(
                    'Dispositivo 2',
                    style: AppTheme.lightTheme.textTheme.headlineMedium,
                  )),
              DropdownMenuItem(
                  value: 3,
                  child: Text(
                    'Dispositivo 3',
                    style: AppTheme.lightTheme.textTheme.headlineMedium,
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
        body: Container(
          height: MediaQuery.of(context).size.height - 500,
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          decoration: const BoxDecoration(
              color: AppTheme.mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Row(
            children: [
              Text(
                'Hola',
                style: AppTheme.lightTheme.textTheme.headlineLarge,
              )
            ],
          ),
        ));
  }
}
