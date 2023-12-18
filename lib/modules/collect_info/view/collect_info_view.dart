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

  Future<void> removeItem(int index, String item) async {
    await widget.infoController.deleteItem(item);
    animatedKey.currentState?.removeItem(
      index,
      (context, animation) => CollectInfoCardDeletion(animation: animation),
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> addItem() async {
    await widget.infoController.addInfo(infoController.text);
    animatedKey.currentState?.insertItem(
      0,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.infoController.getItems();
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
                          showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(minWidth: constraints.maxWidth),
                            builder: (context) {
                              return ConfimActionModal(
                                mainTextButton: 'Desejo adicionar',
                                onTap: () {
                                  Navigator.pop(context);
                                  addItem();
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Adicionar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    ListenableBuilder(
                      listenable: widget.infoController,
                      builder: (context, child) => Expanded(
                        child: AnimatedList(
                          key: animatedKey,
                          shrinkWrap: true,
                          reverse: true,
                          initialItemCount: widget.infoController.items.length,
                          itemBuilder: (context, index, animation) {
                            final String item = widget.infoController.items[index];
                            return CollectInfoCard(
                              title: item,
                              onDelete: () {
                                showModalBottomSheet(
                                  context: context,
                                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                                  builder: (context) {
                                    return ConfimActionModal(
                                      mainTextButton: 'Desejo remover',
                                      onTap: () {
                                        Navigator.pop(context);
                                        removeItem(index, item);
                                      },
                                    );
                                  },
                                );
                              },
                              animation: animation,
                            );
                          },
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
