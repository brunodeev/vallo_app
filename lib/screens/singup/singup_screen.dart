// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallo_app/models/user_model.dart';

import '../../constants/constant_colors.dart';
import '../../helpers/validators.dart';
import '../../models/user_manager.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  UserModel user = UserModel();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: ListView(
        physics: MediaQuery.of(context).viewInsets.bottom == 0
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .15, bottom: 35),
            height: 150,
            child: Image.asset('assets/images/logo_vallo_transparent.png'),
          ),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    shrinkWrap: true,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFD6D6D6),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9.5),
                            hintText: 'Nome',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF646464),
                            ),
                          ),
                          autocorrect: false,
                          style: const TextStyle(color: kPrimaryColor),
                          validator: (name) {
                            if (name == null || name.length < 3) {
                              return 'Digite um nome válido';
                            } else if (name.trim().split(' ').length <= 1) {
                              return 'Insira seu nome completo';
                            }
                            return null;
                          },
                          onSaved: (name) => user.name = name,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFD6D6D6),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9.5),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF646464),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: const TextStyle(color: kPrimaryColor),
                          validator: (email) {
                            if (!emailValid(email!)) {
                              return 'Email Inválido';
                            }
                            return null;
                          },
                          onSaved: (email) => user.email = email,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFD6D6D6),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9.5),
                            hintText: 'Senha',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF646464),
                            ),
                          ),
                          autocorrect: false,
                          style: const TextStyle(color: kPrimaryColor),
                          obscureText: true,
                          validator: (password) {
                            if (password == null || password.length < 6) {
                              return 'Senha Inválida';
                            }
                            return null;
                          },
                          onSaved: (password) => user.password = password,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFD6D6D6),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Confirmar Senha',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF646464),
                            ),
                          ),
                          autocorrect: false,
                          style: const TextStyle(color: kPrimaryColor),
                          obscureText: true,
                          validator: (password) {
                            if (password == null || password.length < 6) {
                              return 'Senha Inválida';
                            }
                            return null;
                          },
                          onSaved: (confirmPassword) =>
                              user.confirmPassword = confirmPassword,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                print('Salvou!');

                                if (user.password != user.confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Senhas não correspondem',
                                          style: TextStyle(fontSize: 18)),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                              }
                            },
                            child: const Text(
                              'Criar Conta',
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 16),
                            )),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
