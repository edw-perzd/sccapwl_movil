import 'package:all_bluetooth/all_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';

class ConnectBluetooth extends StatefulWidget {
  const ConnectBluetooth({super.key});

  @override
  State<ConnectBluetooth> createState() => _ConnectBluetoothState();
}

class _ConnectBluetoothState extends State<ConnectBluetooth> {

  final boundedDevices = ValueNotifier(<BluetoothDevice>[]);
  @override
  void initState() {
    super.initState();
    Future.wait([
      Permission.bluetooth.request(),
      Permission.bluetoothConnect.request(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: allBluetooth.streamBluetoothState,
      builder: (context, snapshot) {
        final bluetoothOn = snapshot.data ?? false;
        print(bluetoothOn);
        return Scaffold(
          appBar: AppBar(title: const Text("Bluetooth conectado"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: switch (bluetoothOn) {
              false => null,
              true => () {
                allBluetooth.startBluetoothServer();
              },
            },
            // backgroundColor:
            // bluetoothOn ? Theme.of(context).primaryColor : Colors.grey,
            // child: Icon(Icons.wifi_tethering),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      switch(bluetoothOn){
                        true => "Encendido",
                        false => "Apagado",
                      },
                      style: TextStyle(
                        color: bluetoothOn ? Colors.green : Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: switch (bluetoothOn) {
                        false => null,
                        true => () async {
                          final devices = await allBluetooth.getBondedDevices();
                          boundedDevices.value = devices;
                        },
                      }, 
                      child: const Text("Dispositivos conectados"),
                    ),
                  ],
                ),
                if (bluetoothOn)
                const Center(
                  child: Text("Bluetoth encendido"),
                ),
                ValueListenableBuilder(
                  valueListenable: boundedDevices,
                  builder: (context, devices, child) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: boundedDevices.value.length,
                        itemBuilder: (context, index) {
                          final device = devices[index];
                          return ListTile(
                            title: Text(device.name),
                            subtitle: Text(device.address),
                            onTap: () {
                              allBluetooth.connectToDevice(device.address);
                            },
                          );
                        },
                      )
                    );
                  }
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}