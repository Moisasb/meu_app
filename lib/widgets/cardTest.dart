import 'package:flutter/material.dart';

class Cardtest extends StatelessWidget {
  final IconData? icon;

  final String text;

  final String title;

  const Cardtest({
    super.key,
    this.icon,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 40),
          Icon(icon),

          SizedBox(height: 20),
          Text(text),
        ],
      ),
    );
  }
}
