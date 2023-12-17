import 'package:flutter/material.dart';

import '../../../exports.dart';

class CollectInfoView extends StatefulWidget {
  final LoginController controller;
  const CollectInfoView({super.key, required this.controller});

  @override
  State<CollectInfoView> createState() => _CollectInfoViewState();
}

class _CollectInfoViewState extends State<CollectInfoView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController infoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: constraints,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: Text(
                          'Olá ${widget.controller.user?.name} adicione cards aqui!',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    TextFormFieldComponent(
                      hint: 'Informação',
                      controller: infoController,
                      validator: emptyValidator,
                      textInputAction: TextInputAction.go,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: () {
                          if (!(formKey.currentState?.validate() ?? false)) {
                            return;
                          }
                          //widget.controller.login(name: nameController.text, password: passwordController.text);
                        },
                        child: const Text(
                          'Adicionar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
