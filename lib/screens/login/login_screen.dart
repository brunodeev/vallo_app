import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallo_app/constants/constant_colors.dart';
import 'package:vallo_app/helpers/validators.dart';
import 'package:vallo_app/models/user_manager.dart';
import 'package:vallo_app/models/user_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFD6D6D6),
                        ),
                        child: TextFormField(
                          enabled: !userManager.loading,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFD6D6D6),
                        ),
                        child: TextFormField(
                          enabled: !userManager.loading,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kPrimaryColor.withOpacity(.7),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    userManager.signIn(
                                      user: UserModel(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                      onFail: (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(e,
                                                style: const TextStyle(
                                                    fontSize: 18)),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      onSuccess: () {},
                                    );
                                  }
                                },
                          child: !userManager.loading
                              ? const Text(
                                  'Entrar',
                                  style: TextStyle(
                                      color: kSecondaryColor, fontSize: 16),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signup');
                          },
                        ),
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
