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
        backgroundColor: kSecondaryColor,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 35),
            height: 150,
            child: Image.asset('assets/images/logo_vallo_transparent.png'),
          ),
          Center(
            child: Form(
              key: formKey,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: const Color(0xFFD6D6D6),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Color(0xFF646464),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      style: const TextStyle(color: Color(0xFF646464)),
                      validator: (email) {
                        if (!emailValid(email!)) {
                          return 'Email Inválido!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: const Color(0xFFD6D6D6),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Senha',
                        hintStyle: TextStyle(
                          color: Color(0xFF646464),
                        ),
                      ),
                      autocorrect: false,
                      style: const TextStyle(color: Color(0xFF646464)),
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.length < 6) {
                          return 'Senha Inválida';
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 6),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        formKey.currentState!.validate();
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: kSecondaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
