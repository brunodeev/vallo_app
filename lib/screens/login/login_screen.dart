import 'package:flutter/material.dart';
import 'package:vallo_app/constants/constant_colors.dart';
import 'package:vallo_app/helpers/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          color: kPrimaryColor.withOpacity(.9),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Color(0x95FFFFFF),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  style: const TextStyle(color: Colors.white),
                  validator: (email) {
                    if (!emailValid(email!)) {
                      return 'Email Inválido!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                      color: Color(0x95FFFFFF),
                    ),
                  ),
                  autocorrect: false,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  validator: (password) {
                    if (password == null || password.length < 6) {
                      return 'Senha Inválida';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Esqueci minha senha!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    formKey.currentState!.validate();
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
