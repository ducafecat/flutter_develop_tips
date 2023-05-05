import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final Color? textColor;
  final Color? buttonColor;
  final double? borderRadius;
  final double? height;
  final double? width;

  const MyElevatedButton({
    Key? key,
    this.onPressed,
    this.text,
    this.icon,
    this.textColor,
    this.buttonColor,
    this.borderRadius,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.0,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        child: icon == null
            ? Text(
                text!,
                style: TextStyle(color: textColor ?? Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: textColor ?? Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    text!,
                    style: TextStyle(color: textColor ?? Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
