// Tela de Catalogo

import 'dart:io';

import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // dados do nosso catalogo
  // List<String> Siginifica:
  // List -> uma coleção de valores;
  // String -> é que cada valor sera guardado em formato de texto;
  final List<String> produtos = const [
    'Notebook',
    'Celular',
    'Headset',
    'Teclado',
    'Mouse',
    'Monitor',
  ];

  final List<String> pecas = const [
    'Placa mãe',
    'Placa de video',
    'Processador',
    'Memoria ram',
    'SSD',
    'HD',
    'Gabinete',
    'Water cooler',
    'Pasta Térmica'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produtos em destaque',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // A listview sera adicionada aqui
            SizedBox(
              // Como a nossa listview sera horizontal, precisamos reservar
              // uma altura para essa area, que ela podera ocupar
              height: 120,

              child: ListView.builder(
                // Por padrão, a listview rola verticalmente
                // Axis.horizontal muda a direção da rolagem
                scrollDirection: Axis.horizontal,

                // Define quantos itens a listview irá construir
                itemCount: produtos.length,

                // descreve como cada item sera montado
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, size: 32),
                        const SizedBox(height: 8),

                        Text(
                          // Index indica qual a posição esta sendo construida
                          produtos[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Novas Peças para montar o seu Setup',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 250,

              child: GridView.builder(
                itemCount: pecas.length,

                gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.5,
                ),

                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 87, 182),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.computer,
                          size: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          pecas[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Todos os Produtos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Nossa GridView sera adicionada aqui
            Expanded(
              child: GridView.builder(
                itemCount: produtos.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),

                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag,
                          size: 40,
                        ),

                        const SizedBox(height: 8),
                        Text(
                          produtos[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
