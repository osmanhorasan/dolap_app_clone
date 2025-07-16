import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:flutter/material.dart';

class AuthResetPassword extends StatefulWidget {
  const AuthResetPassword({super.key});

  @override
  State<AuthResetPassword> createState() => _AuthResetPasswordState();
}

class _AuthResetPasswordState extends State<AuthResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isEposta = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  showAlertDialogResetPassword(
                    context as BuildContext,
                    formKey,
                    emailController,
                    isEposta,
                  );
                },
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(color: Color(0xff08E1A1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

showAlertDialogResetPassword(
  BuildContext context,
  final GlobalKey<FormState> formKey,
  final TextEditingController emailController,
  bool isEposta,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Şifremi Unuttum"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            content: Container(
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Email adresine göndereceğimiz linke tıklayarak yeni şifre belirleyebilirsiniz.",
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "E-posta",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "E-posta boş bırakılamaz";
                            }
                            if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                            ).hasMatch(value)) {
                              return "Geçerli bir e-posta adresi girin";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              isEposta = value.isNotEmpty;
                            });
                          },
                        ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: AuthButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide(
                                        color: Color(0xff08E1A1),
                                        width: 1.5,
                                      ),
                                    ),
                                    foregroundColor: Color(0xff08E1A1),
                                    backgroundColor: Colors.white,
                                  ),
                                  title: Text(
                                    "Kapat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: AuthButton(
                                  onPressed:
                                      (formKey.currentState?.validate() ??
                                          false)
                                      ? () {
                                          Navigator.of(context).pop();
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                content: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        SizedBox(height: 20),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          "Şifre güncellemesi için gerekli bilgiler\ne-posta adresine gönderildi.",
                                                        ),
                                                        SizedBox(height: 20),
                                                        SizedBox(
                                                          height: 50,
                                                          child: AuthButton(
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                  context,
                                                                ).pop(),
                                                            style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      100,
                                                                    ),
                                                                side: BorderSide(
                                                                  color: Color(
                                                                    0xff08E1A1,
                                                                  ),
                                                                  width: 1.5,
                                                                ),
                                                              ),
                                                              foregroundColor:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Color(
                                                                    0xff08E1A1,
                                                                  ),
                                                            ),
                                                            title: Text(
                                                              "Tamam",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      : null,
                                  title: Text(
                                    "Gönder",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
