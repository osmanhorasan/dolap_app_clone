import 'package:dolap_app_clone/ui/auth/auth_button.dart';
import 'package:dolap_app_clone/widgets/auth/auth_or.dart';
import 'package:dolap_app_clone/widgets/auth/auth_ready.dart';
import 'package:dolap_app_clone/widgets/auth/auth_reset_password.dart';
import 'package:dolap_app_clone/widgets/auth/register/auth_register_acceptance_texts.dart';
import 'package:flutter/material.dart';

class AuthRegisterForm extends StatefulWidget {
  const AuthRegisterForm({super.key});

  @override
  State<AuthRegisterForm> createState() => _AuthRegisterFormState();
}

class _AuthRegisterFormState extends State<AuthRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool isVisibilityEye = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-posta',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "E-posta boş bırakılamaz!";
                }
                if (!RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                ).hasMatch(value)) {
                  return "Geçerli bir e-posta adresi girin";
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kullanıcı adı zorunlu bir alan";
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Telefon Numarası',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kullanıcı adı zorunlu bir alan";
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: isVisibilityEye,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibilityEye = !isVisibilityEye;
                    });
                  },
                  icon: Icon(
                    isVisibilityEye ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Şifre alanı boş bırakılamaz';
                }
                if (!RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,64}$',
                ).hasMatch(value)) {
                  return 'Şifre en az bir büyük harf, bir küçük harf, bir rakam ve bir özel\nkarakter içermelidir';
                }
                if (value.contains('dolap')) {
                  return 'Şifre "dolap" kelimesini içermemelidir';
                }
                if (value.length < 10 && value.length > 64) {
                  return 'En az 10, en fazla 64 karakter olmalıdır';
                }

                return null;
              },
            ),
            SizedBox(height: 10),
            AuthRegisterAcceptanceTexts(),
            SizedBox(height: 20),
            AuthButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xff08E1A1),
                      content: Text('Kayıt başarılı yönlendiriliyorsunuz...'),
                    ),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              title: Text(
                "Üye Ol",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff08E1A1),
                foregroundColor: Color(0xffFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
            ),

            AuthReady(
              type: "REGISTER", // or "LOGIN" based on your logic
            ),
          ],
        ),
      ),
    );
  }
}
