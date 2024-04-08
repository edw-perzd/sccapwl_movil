import 'package:flutter/material.dart';
import 'package:sccapwl_movil/themes/app_theme.dart';

class CustomizedButton extends StatelessWidget {
  final bool stateProcess;
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomizedButton(
      {super.key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor,
      required this.stateProcess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: stateProcess
                ? const CircularProgressIndicator(
                    color: AppTheme.mainColor,
                    backgroundColor: AppTheme.backColor,
                  )
                : Text(
                    buttonText!,
                    style: TextStyle(color: textColor, fontSize: 25),
                  ),
          ),
        ),
      ),
    );
  }
}
