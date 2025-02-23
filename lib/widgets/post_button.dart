import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key, required this.icon, this.color= Colors.grey, required this.count, required this.onPressed});
  final IconData icon;
  final Color color;
  final String count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Wrap(
        spacing: 5,
        children: [
          Icon(icon, color: color,),
          Text(count),
        ],
      ),
    );
  }
}