import 'package:fluttertoast/fluttertoast.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.mainColor,
      textColor: AppTheme.backColor);
}
