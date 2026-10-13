import 'package:flutter/material.dart';

class AparenciaScreen extends StatelessWidget {
  const AparenciaScreen({
    super.key,
    required this.modoAtual,
    required this.aoAlterarTema,
  });

  // Referência ao modo de tema selecionado
  final ThemeMode modoAtual;

  // Callback para alterar o tema
  final void Function(ThemeMode) aoAlterarTema;

  @override
  Widget build(BuildContext context) {
    // Lê as cores do tema ativo nesta tela
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Aparência')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Escolha o tema do aplicativo',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),

              // Botões para selecionar o tema
              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text('Sistema'),
                  ),
                  ButtonSegment(value: ThemeMode.light, label: Text('Claro')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Escuro')),
                ],
                selected: {modoAtual},
                onSelectionChanged: (novosModos) {
                  aoAlterarTema(novosModos.first);
                },
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 5, 91, 117),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Este cartão utiliza uma cor fixa no fundo '
                  'e texto branco.',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),

              const SizedBox(height: 16),

              // Segundo cartão
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cores.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Este cartão acompanha o tema. '
                  'O fundo e o texto mudam entre os modos '
                  'claro e escuro.',
                  style: TextStyle(color: cores.onSurface),
                ),
              ),

              const SizedBox(height: 16),

              // Botão de exemplo
              const FilledButton(
                onPressed: null,
                child: Text('Botão de exemplo'),
              ),

              const SizedBox(height: 24),

              Text(
                'Modo selecionado: ${switch (modoAtual) {
                  ThemeMode.system => 'Sistema',
                  ThemeMode.light => 'Claro',
                  ThemeMode.dark => 'Escuro',
                }}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 8),

              Text(switch (modoAtual) {
                ThemeMode.system =>
                  'O aplicativo acompanha o tema configurado '
                      'no dispositivo.',
                ThemeMode.light => 'O aplicativo utiliza sempre o tema claro.',
                ThemeMode.dark => 'O aplicativo utiliza sempre o tema escuro.',
              }, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
