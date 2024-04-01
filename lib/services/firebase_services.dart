import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDevices() async {
  List devices = [];
  CollectionReference cfDevices = db.collection('Dispositivos');

  QuerySnapshot queryDevices = await cfDevices.get();

  queryDevices.docs.forEach((document) {
    devices.add(document);
  });

  return devices;
}
