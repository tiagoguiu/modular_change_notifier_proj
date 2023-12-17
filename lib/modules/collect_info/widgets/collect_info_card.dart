import 'package:flutter/material.dart';

class CollectInfoCard extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;
  final Animation<double> animation;
  const CollectInfoCard({super.key, required this.title, required this.onDelete, required this.animation});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: UniqueKey(),
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(32),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/onebox_idtech_logo.jpg',
              ),
            ),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
