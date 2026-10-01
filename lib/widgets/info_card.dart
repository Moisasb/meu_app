// WIDGETS RETILIZÁVEL DE INFORMAÇÃO

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // icone que sera exibido
  final IconData? icon;

  final String text;

  const InfoCard({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(children: [Icon(icon), const SizedBox(width: 12), Text(text)]),
    );
  }
}
