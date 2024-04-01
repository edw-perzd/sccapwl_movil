import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sccapwl_movil/screens/devices_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // const GlassWidget(fillLevel: 0.6),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 100),
                padding: const EdgeInsets.all(40),
                height: 250,
                decoration: BoxDecoration(
                    color: AppTheme.backColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('80%',
                                style: AppTheme
                                    .lightTheme.textTheme.headlineLarge),
                            Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      '250 L',
                                      style: AppTheme
                                          .lightTheme.textTheme.headlineMedium,
                                    ),
                                    Text(
                                      '1000 L',
                                      style: AppTheme
                                          .lightTheme.textTheme.bodyMedium,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const CircularProgressIndicator(
                          backgroundColor: AppTheme.mediumColor,
                          color: AppTheme.mainColor,
                          strokeWidth: 40,
                          value: 0.8,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Última actualización: 08:50 - 31/03/2024',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Calidad del agua: Buena',
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10),
                    //   child: Text(
                    //     'Calidad del agua: Buena',
                    //     style: AppTheme.lightTheme.textTheme.bodySmall,
                    //   ),
                    // )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Card cardTemp() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(WeatherIcons.thermometer)),
            Text(
              'Temperatura',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  '23.5',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
                Text(
                  ' °C',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card cardPH() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.science)),
            Text(
              'Nivel de pH',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  '7.0',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card cardTurbidez() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.local_drink)),
            Text(
              'Turbidez',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  '7.0',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
                Text(
                  ' NTU',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card cardTDS() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.water_drop)),
            Text(
              'Nivel de TDS',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  '500',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
                Text(
                  ' PPM',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card cardCantAgua() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.water)),
            Text(
              'Cant. de agua',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  '500',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
                Text(
                  ' L',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card cardEstado() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  null;
                },
                icon: const Icon(Icons.power_settings_new)),
            Text(
              'Encender',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

// class GlassWidget extends StatelessWidget {
//   final double fillLevel; // Nivel de llenado del vaso, debe estar entre 0 y 1

//   const GlassWidget({super.key, required this.fillLevel});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: const Size(100, 200), // Tamaño del vaso
//       painter: GlassPainter(fillLevel: fillLevel),
//     );
//   }
// }

// class GlassPainter extends CustomPainter {
//   final double fillLevel;

//   GlassPainter({required this.fillLevel});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     double glassHeight = size.height;
//     double glassWidth = size.width;

//     double filledHeight = fillLevel * glassHeight; // Altura de llenado

//     Path path = Path()
//       ..moveTo(0, glassHeight)
//       ..lineTo(0, glassHeight - filledHeight)
//       ..quadraticBezierTo(glassWidth / 2, glassHeight / 2, glassWidth,
//           glassHeight - filledHeight)
//       ..lineTo(glassWidth, glassHeight)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
