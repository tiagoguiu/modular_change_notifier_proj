import 'package:flutter/material.dart';

class ConfimActionModal extends StatelessWidget {
  final String mainTextButton;
  final VoidCallback onTap;
  const ConfimActionModal({
    super.key,
    required this.mainTextButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.15,
          child: const Divider(thickness: 4),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            TextButton(onPressed: onTap, child: Text(mainTextButton)),
          ],
        ),
      ],
    );
  }
}
