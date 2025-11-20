import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onFavorite;

  const ActionButtons({
    super.key,
    required this.onClose,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onClose,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(Icons.close, color: Colors.white, size: 30),
          ),
        ),

        SizedBox(width: 40),

        // Favorite button
        InkWell(
          onTap: onFavorite,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.teal,
            child: Icon(Icons.favorite, color: Colors.white, size: 35),
          ),
        ),
      ],
    );
  }
}
