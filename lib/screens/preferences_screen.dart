// TELA DE PREFERENCIAS

import 'package:flutter/material.dart';

// Nossa tela tera mudanças, por isso escolhemos a opção de StatefullWidget
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  // estamos preparando o widget para ter alteração de estado
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

// Estado da Tela
// A classe State guarda os valores que podem mudar
// e contem o metodo build() que monta a interface
class _PreferencesScreenState extends State<PreferencesScreen> {
  //String esta guarando texto  com algumas valores já inicial
  //Iniciaremos o dropdown
  String temaSelecionado = 'Tecnologia';
  // Essa guarda o valor do Radio selecionado, que começa inicialmente com iniciante
  String nivelSelecionado = 'Ini';
  // false significa que a opção começa desmarcada
  bool receberNovidades = false;
  // Começa com false  portanto o Switch iniciara desligado
  bool receberNotificacao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Configure suas preferencias',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 24),

              // Os componentes seram adicionados aqui

              //TEXTFIELD: entrada de dados
              const Text(
                'Seu nome',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),
              // TextField ele cria uma campo no qual o ususario pode digitar texto
              TextField(
                // decoration recebe um InputDecoration
                //concentra configurações visuais do campo
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),

              // DROPDOENBUTTON: Selecionando uma opção
              const Text(
                'Tema de interesse',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              //String nada mais é do que informar o TIPO de valor  usado no Dropdown
              DropdownButton<String>(
                // representa o valor selecioando agora
                value: temaSelecionado,
                // true ele vai ocupar a largura toda disponivel
                // false usa apenas o espaço necessario
                isExpanded: true,

                // items recebe a lista opções
                items: const [
                  // value -> valor usado internamente
                  // child -> widget a ser exibido

                  DropdownMenuItem(
                    value: 'Tecnologia',
                    child: Text('Tecnologia'),
                  ),

                  DropdownMenuItem(value: 'Jogos', child: Text('Jogos')),
                  DropdownMenuItem(value: 'Design', child: Text('Design')),
                ],

                // recebe um função  executada quando a seleção muda
                onChanged: (novoValor) {
                  if (novoValor != null) {
                    setState(() {
                      temaSelecionado = novoValor;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),

              // RADIOLISTTILE: value x groupValue
              const Text(
                'Nivel de experiencia',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // usamos para criar um grupo de radio informando que recebera apenas string
              RadioGroup<String>(
                // carrega o valor que esta selecioando
                groupValue: nivelSelecionado,
                // a funação para infomar o novo valor selecioando
                onChanged: (novoValor) {
                  if (novoValor != null) {
                    setState(() {
                      nivelSelecionado = novoValor;
                    });
                  }
                },

                // aqui criamos os radios e os valores
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Ini'),
                        value: 'Ini',
                      ),
                    ),

                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Inte'),
                        value: 'Inte',
                      ),
                    ),

                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Ava'),
                        value: 'Ava',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //CHECKBOXLISTtITLE e valores booleanos
              CheckboxListTile(
                title: const Text('Quero receber novidades'),
                value: receberNovidades,
                onChanged: (novoValor) {
                  setState(() {
                    receberNovidades = novoValor ?? false;
                  });
                },
              ),

              const SizedBox(height: 8),

              // SwitchListTile
              SwitchListTile(
                title: const Text(' Ativivar notificações'),

                value: receberNotificacao,
                onChanged: (novoValor) {
                  setState(() {
                    receberNotificacao = novoValor;
                  });
                },
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumo das Preferencias',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),
                    
                    Text('Tema : $temaSelecionado'),
                    Text('Nivel: $nivelSelecionado'),
                    Text(
                      'Novidades:'
                      '${receberNovidades ? 'Sim' : 'Não'} ',
                    ),
                    Text(
                      'Notificações:'
                      '${receberNotificacao ? 'Ativadas' : 'Desetivadas'}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}