import 'package:sccapwl_movil/services/firebase_services.dart';
import 'package:sccapwl_movil/widgets/toast.dart';

class Users {
  String id;
  String? nombreUsuario;
  String email;
  String? aPaterno;
  String? aMaterno;

  Users(
      {required this.id,
      required this.email,
      this.nombreUsuario,
      this.aPaterno,
      this.aMaterno});

  void deleteUser() {
    id = '';
    nombreUsuario = '';
    email = '';
    aPaterno = '';
    aMaterno = '';
  }

  void getUserData() async {
    try {
      await firebaseInstance
          .collection('usuarios')
          .doc(id)
          .get()
          .then((documento) {
        documento.data();
        nombreUsuario = documento.data()?['username'];
        aPaterno = documento.data()?['aPaterno_usuario'];
        aMaterno = documento.data()?['aMaterno_usuario'];
      });
    } catch (e) {
      showToast(
          message:
              'Ha ocurrido un error al leer la informacion del usuario. $e');
    }

    print(nombreUsuario);
  }
}
