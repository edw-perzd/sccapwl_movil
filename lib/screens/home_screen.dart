import 'package:flutter/material.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

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
          alignment: AlignmentDirectional.center,
          value: dropdownValue,
          icon: IconTheme(
              data: AppTheme.lightTheme.iconTheme,
              child: const Icon(Icons.keyboard_arrow_down)),
          style: const TextStyle(color: AppTheme.darkColor),
          items: const [
            DropdownMenuItem(
                value: 1,
                child: Text(
                  'Dispositivo 1',
                  style: TextStyle(color: AppTheme.darkColor),
                )),
            DropdownMenuItem(
                value: 2,
                child: Text(
                  'Dispositivo 2',
                  style: TextStyle(color: AppTheme.darkColor),
                )),
            DropdownMenuItem(
                value: 3,
                child: Text(
                  'Dispositivo 3',
                  style: TextStyle(color: AppTheme.darkColor),
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
    );
  }
}
