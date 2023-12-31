import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../exports.dart';

class LoginView extends StatefulWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final FocusNode nameFocus = FocusNode();
  late final FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Modular.get<LocalStorageService>().init();
        if (widget.controller.user != null) {
          Modular.to.navigate('/collect-info');
        }
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocus.dispose();
    passwordFocus.dispose();
    passwordController.dispose();
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(flex: 16),
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
                          onPressed: () {
                            if (!(formKey.currentState?.validate() ?? false)) {
                              return;
                            }
                            widget.controller.login(name: nameController.text, password: passwordController.text);
                          },
                          child: Visibility(
                            replacement: const SizedBox(
                              height: 26,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            visible: !widget.controller.isLoading,
                            child: const Text(
                              'Entrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(flex: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
