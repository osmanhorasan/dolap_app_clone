import 'package:dolap_app_clone/ui/checkbox_ui.dart';
import 'package:flutter/material.dart';

class AuthRegisterAcceptanceTexts extends StatefulWidget {
  const AuthRegisterAcceptanceTexts({super.key});

  @override
  State<AuthRegisterAcceptanceTexts> createState() =>
      _AuthRegisterAcceptanceTextsState();
}

class _AuthRegisterAcceptanceTextsState
    extends State<AuthRegisterAcceptanceTexts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxUi(),
              SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text:
                            'İndirimlerden ve kampanyalardan haberdar olmak için\n',
                      ),
                      TextSpan(
                        text: 'Elektronik İleti',
                        style: TextStyle(color: Color(0xff08E1A1)),
                      ),
                      TextSpan(text: 'almak istiyorum.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxUi(),
              SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text:
                            'Tarafıma avantajlı tekliflerin sunulabilmesi\namacıyla kişisel verilerimin işlenmesine',
                      ),
                      TextSpan(
                        text: ' açık rıza\n',
                        style: TextStyle(color: Color(0xff08E1A1)),
                      ),
                      TextSpan(text: 'almak istiyorum.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
