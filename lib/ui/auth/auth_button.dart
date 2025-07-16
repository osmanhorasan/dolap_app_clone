import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Text? title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final MainAxisAlignment? mainAxisAlignment;

  const AuthButton({
    super.key,
    this.title,
    this.onPressed,
    this.style,
    this.icon,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            style ??
            ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFAFAFA),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              side: BorderSide(color: Colors.black26, width: 0.5),
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
            ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            SizedBox(width: 8.0),
            title ?? Text("Default Button"),
          ],
        ),
      ),
    );
  }
}
