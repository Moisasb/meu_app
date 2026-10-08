import 'package:flutter/material.dart';

class AparenciaScreen extends StatelessWidget {
  const AparenciaScreen({
    super.key,
    required this.modoAtual,
    required this.aoAlterarTema,
  });

  final ThemeMode modoAtual;

  final void Function(ThemeMode) aoAlterarTema;

  @override
  Widget build(BuildContext context) {
    // final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aparência'),
      ),
      body: const Text('Tela de Aparência'),
    );
  }
}
