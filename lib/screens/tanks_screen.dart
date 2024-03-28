import 'package:flutter/material.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
import 'package:sccapwl_movil/screens/home_screen.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

class TanksScreen extends StatefulWidget {
  const TanksScreen({super.key});

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
                selected: true,
                selectedTileColor: AppTheme.mediumColorTrans,
                // selectedColor: AppTheme.mediumColor,
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
                  null;
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
        title: Text(
          'Mis depósitos',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.backColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.water)),
                title: Text(
                  'Rotoplas techo 1',
                  style: AppTheme.lightTheme.textTheme.headlineMedium,
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Vinculado a: ',
                      style: AppTheme.lightTheme.textTheme.bodySmall,
                    ),
                    Text(
                      'Dispositivo 2',
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.backColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: IconTheme(
                    data: AppTheme.lightTheme.iconTheme,
                    child: const Icon(Icons.water)),
                title: Text(
                  'Cisterna',
                  style: AppTheme.lightTheme.textTheme.headlineMedium,
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Vinculado a: ',
                      style: AppTheme.lightTheme.textTheme.bodySmall,
                    ),
                    Text(
                      'Dispositivo 1',
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
