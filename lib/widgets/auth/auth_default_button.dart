import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:flutter/material.dart';

class AuthDefaultButton extends StatefulWidget {
  final String? type;
  final bool? isTitle;
  final bool? isIcon;
  final VoidCallback? onPressed;

  const AuthDefaultButton({
    super.key,
    this.type,
    this.isTitle = true,
    this.isIcon = true,
    this.onPressed,
  });

  @override
  State<AuthDefaultButton> createState() => _AuthDefaultButtonState();
}

class _AuthDefaultButtonState extends State<AuthDefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AuthButton(
            onPressed: () {
              if (widget.type == "REGISTER") {
                Navigator.pushNamed(context, '/auth/register');
              } else {
                Navigator.pushNamed(context, '/auth/login');
              }
            },
            icon: (widget.isIcon ?? true)
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.mail, size: 24),
                  )
                : Container(),
            title: (widget.isTitle ?? true)
                ? Text(
                    "Kullanıcı Adı/E-posta ile Giriş yap",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(""),
          ),
        ),
      ],
    );
  }
}
