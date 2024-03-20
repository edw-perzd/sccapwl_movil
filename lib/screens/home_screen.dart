import 'package:flutter/material.dart';
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
        leading: IconButton(
          color: AppTheme.darkColor,
          icon: const Icon(Icons.menu),
          onPressed: () {
            null;
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // const GlassWidget(fillLevel: 0.6),
            SizedBox(
              height: 450,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircularProgressIndicator(
                    value: 0.8,
                    backgroundColor: AppTheme.backColor,
                    color: AppTheme.mediumColor,
                    strokeWidth: 50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '80%',
                        style: AppTheme.lightTheme.textTheme.headlineLarge,
                      ),
                      Text(
                        'Última actualización:',
                        style: AppTheme.lightTheme.textTheme.headlineMedium,
                      ),
                      Text(
                        '08:50 pm - 18/03/2024',
                        style: AppTheme.lightTheme.textTheme.headlineMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 100, child: cardTemp()),
                SizedBox(
                  height: 100,
                  child: cardPH(),
                ),
                SizedBox(
                  height: 100,
                  child: cardTurbidez(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 100, child: cardTDS()),
                SizedBox(
                  height: 100,
                  child: cardCantAgua(),
                ),
                SizedBox(
                  height: 100,
                  child: cardEstado(),
                ),
              ],
            ),
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
