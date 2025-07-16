import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:flutter/material.dart';

class AuthTrendyolButton extends StatefulWidget {
  final String? type;
  final bool? isTitle;
  final bool? isIcon;
  final VoidCallback? onPressed;

  const AuthTrendyolButton({
    super.key,
    this.type,
    this.isTitle = true,
    this.isIcon = true,
    this.onPressed,
  });

  @override
  State<AuthTrendyolButton> createState() => _AuthTrendyolButtonState();
}

class _AuthTrendyolButtonState extends State<AuthTrendyolButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AuthButton(
            onPressed: () {
              if (widget.type == "REGISTER") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xff08E1A1),
                    content: Text('Kayıt başarılı yönlendiriliyorsunuz...'),
                  ),
                );
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xff08E1A1),
                    content: Text('Giriş başarılı yönlendiriliyorsunuz...'),
                  ),
                );
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            icon: (widget.isIcon ?? true)
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                      "https://tms.trendyol.com/images/qoute-bottom.png?v=1.2",
                      width: 24,
                    ),
                  )
                : Container(),
            title: (widget.isTitle ?? true)
                ? Text(
                    "Trendyol ile Devam Et",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(""),
          ),
        ),
      ],
    );
  }
}
