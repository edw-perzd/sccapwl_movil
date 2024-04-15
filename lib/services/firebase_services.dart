import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDevices(id) async {
  List devices = [];
  await firebaseInstance
      .collection('dispositivos')
      .where('id_usuario', isEqualTo: id)
      .snapshots()
      .listen((resultados) {
    resultados.docs.forEach((elements) {
      devices.add(elements.data());
    });
  });
  return devices;
}

final firebaseInstance = FirebaseFirestore.instance;
void registerUser(username, email, id) {
  firebaseInstance.collection('usuarios').doc(id).set({
    'username': username,
    'correoE_usuario': email,
  });
}

void setDevice(id, nombre, idUser) {
  firebaseInstance.collection('dispositivos').doc(id).set({
    'nombre_dispositivo': nombre,
    'id_usuario': idUser,
  });
}

Future<String> setThank(idDevice, nombre, altura, tipo, ancho, largo) async {
  String idThank = '';
  try {
    var documentRef =
        await firebaseInstance.collection('depositos').doc(idDevice).set({
      "id_dispositivo": idDevice,
      "nombre_deposito": nombre,
      "altura_deposito": altura,
      "tipo_deposito": tipo,
      "ancho_deposito": ancho,
      "largo_deposito": largo,
      "agua_contenida": {
        "nivelTemp_agua": 0.0,
        "nivelpH_agua": 0.0,
        "nivelTDS_agua": 0.0,
        "cantidad_agua": 0.0,
        "estado_agua": false,
        "ultimaActualizacion_agua": ''
      }
    });
    idThank = idDevice;
  } on Exception catch (e) {
    showToast(message: 'Hubo un error al registrar el deposito. $e');
  }
  return idThank;
}

Future<bool> getDepositos(id) async {
  List dispositivos = [];
  await firebaseInstance
      .collection('depositos')
      .where('id_dispositivo', isEqualTo: id)
      .snapshots()
      .listen((resultados) {
    resultados.docs.forEach((elements) {
      dispositivos.add(elements.data());
    });
  });
  if (dispositivos.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future<List<Map<String, dynamic>>> getTanksById(String id) async {
  List<Map<String, dynamic>> depositUser = [];
  try {
    var dispositivosSnapshot = await firebaseInstance
        .collection('dispositivos')
        .where('id_usuario', isEqualTo: id)
        .get();

    for (var dispositivoDoc in dispositivosSnapshot.docs) {
      var idDispositivo = dispositivoDoc.data()['id_dispositivo'];
      var depositosSnapshot = await firebaseInstance
          .collection('depositos')
          .where('id_dispositivo', isEqualTo: idDispositivo)
          .get();

      for (var depositoDoc in depositosSnapshot.docs) {
        depositUser.add(depositoDoc.data());
      }
    }
  } catch (e) {
    print('Error al obtener los tanques: $e');
  }
  return depositUser;
}
