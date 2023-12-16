import 'package:flutter/material.dart';

import '../../../exports.dart';

class LoginView extends StatefulWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController nameController = TextEditingController();
  late final FocusNode nameFocus = FocusNode();
  late final FocusNode passwordFocus = FocusNode();
  @override
  void dispose() {
    nameController.dispose();
    nameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: constraints,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(flex: 16),
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.asset(
                    'assets/onebox_idtech_logo.jpg',
                  ),
                ),*/
                const Text(
                  'Seja bem vindo!',
                  style: TextStyle(fontSize: 32, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 2),
                ),
                const Spacer(),
                TextFormFieldComponent(
                  hint: 'Nome de usuário',
                  controller: nameController,
                  fieldFocus: nameFocus,
                  nextFocus: passwordFocus,
                  validator: loginValidator,
                  textInputAction: TextInputAction.next,
                ),
                const Spacer(),
                TextFormFieldComponent(
                  hint: 'Senha',
                  isPassword: true,
                  fieldFocus: passwordFocus,
                  validator: loginValidator,
                ),
                const Spacer(),
                ListenableBuilder(
                  listenable: widget.controller,
                  builder: (context, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: () {},
                        child: const Text(
                          'Logar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                ),
                const Spacer(flex: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
