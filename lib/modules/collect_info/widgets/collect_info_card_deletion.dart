import 'package:flutter/material.dart';

class CollectInfoCardDeletion extends StatelessWidget {
  final Animation<double> animation;
  const CollectInfoCardDeletion({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: UniqueKey(),
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(32),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/onebox_idtech_logo.jpg',
              ),
            ),
            title: const Text('Deletando card...'),
          ),
        ),
      ),
    );
  }
}
