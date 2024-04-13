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

Map<String, dynamic>? leerUser(id) {
  try {
    firebaseInstance.collection('usuarios').doc(id).get().then((documento) {
      return documento.data();
    });
  } on FirebaseException catch (e) {
    showToast(
        message:
            'Ha ocurrido un error al leer la informacion del usuario. ${e.code}');
  }
  return null;
}
