import 'package:flutter/material.dart';

import '../../../exports.dart';

class CollectInfoView extends StatefulWidget {
  final LoginController controller;
  final CollectInfoController infoController;
  const CollectInfoView({super.key, required this.controller, required this.infoController});

  @override
  State<CollectInfoView> createState() => _CollectInfoViewState();
}

class _CollectInfoViewState extends State<CollectInfoView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedListState> animatedKey = GlobalKey<AnimatedListState>();
  late final TextEditingController infoController = TextEditingController();
  late final Future<void> intialFunction = widget.infoController.getItems();

  Future<void> removeItem(int index, String item) async {
    await widget.infoController.deleteItem(item);
    animatedKey.currentState?.removeItem(
      index,
      (context, animation) => CollectInfoCardDeletion(animation: animation),
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> addItem() async {
    animatedKey.currentState?.insertItem(
      0,
      duration: const Duration(milliseconds: 600),
    );
    await widget.infoController.addInfo(infoController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: constraints,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
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
                          addItem();
                        },
                        child: const Text(
                          'Adicionar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    FutureBuilder(
                      future: intialFunction,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Expanded(
                            child: AnimatedList(
                              key: animatedKey,
                              shrinkWrap: true,
                              reverse: true,
                              initialItemCount: widget.infoController.items.length,
                              itemBuilder: (context, index, animation) {
                                final String item = widget.infoController.items[index];
                                return CollectInfoCard(
                                  title: item,
                                  onDelete: () => removeItem(index, item),
                                  animation: animation,
                                );
                              },
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
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
