// TELA DE PREFERENCIAS

import 'package:flutter/material.dart';

// Nossa tela terá mudanças, por isso escolhermos a opção de StatefulWidget
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  // Estamos preparando o widget para ter alteração de estado
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

// Estado da tela
// A classe State guarda os valores que podem mudar
// e contem o metodo build() de monta a interface
class _PreferencesScreenState extends State<PreferencesScreen> {
  // String está guardando textos
  // Iniciamos o dropdown
  String temaSelecionado = 'Tecnologia';
  // Essa guarda o valor do Radio selecionado, que começa inicialmente com iniciante
  String nivelSelecionado = 'Iniciante';
  // False significa que a opção começa desmarcada
  bool receberNovidades = false;
  // Começa com false, portanto o Switch iniciara desligado
  bool receberNotificacao = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Configure suas preferencias',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              // Os componentes serao adicionados aqui
              const Text(
                'Seu nome',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 8),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person), 
                ),
              ), 
              
              const SizedBox(height: 20), 
            ],
          ),
        ),
      ),
    );
  }
}
