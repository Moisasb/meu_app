import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() {
    return _EventsScreenState();
  }
}

class _EventsScreenState extends State<EventsScreen> {
  String textoDigitado = '';
  String mensagemEnviada = 'Nenhuma mensagem enviada';
  String ultimoEvento = 'Nenhuma interação ainda';
  int toques = 0;
  int toquesDuplos = 0;
  int toquesLongos = 0;

  void _atualizarTexto(String novoTexto) {
    setState(() {
      textoDigitado = novoTexto;
      ultimoEvento = 'onChanged: texto alterado';
    });
  }

  void enviarMensagem(String valor) {
    // final impede de reatribuir esta variável depois de criada
    final mensagem = valor.trim();

    // trim remove espaços em branco no início e no final da string
    setState(() {
      // setState é usado para notificar o Flutter que o estado do widget mudou
      // e precisa ser reconstruído
      if (mensagem.isEmpty) {
        // isEmpty verifica se a string está vazia
        mensagemEnviada = 'Digite uma mensagem primeiro';
      } else {
        // Caso a mensagem não esteja vazia, atribui a mensagem digitada
        // à variável mensagemEnviada
        mensagemEnviada = mensagem;
      }

      // onSubmitted é chamado quando o usuário envia a mensagem,
      // geralmente pressionando a tecla Enter ou um botão de envio.
      ultimoEvento = 'onSubmitted: envio solicitado';
    });
  }

  void finalizarEdicao() {
    // FocusScope gerencia qual o campo está em foco
    // unfocus remove o foco do campo de texto,
    // fechando o teclado virtual se estiver aberto
    FocusScope.of(context).unfocus();
  }

  void registrarToque() {
    setState(() {
      toques++;
      ultimoEvento = 'onTap: toque simples';
    });
  }

  void registrarToqueDuplo() {
    setState(() {
      toquesDuplos++;
      ultimoEvento = 'onDoubleTap: toque duplo';
    });
  }

  void registrarToqueLongo() {
    setState(() {
      toquesLongos++;
      ultimoEvento = 'onLongPress: toque mantido';
    });
  }

  void zerarToques() {
    setState(() {
      toques = 0;
      toquesDuplos = 0;
      toquesLongos = 0;
      ultimoEvento = 'Onpress: toques zerados';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos e interações')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // Stretch faz com que os elementos filhos ocupem toda
            // a largura disponível
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const Text(
                'Laboratório de interações',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Digite uma mensagem',
                  border: OutlineInputBorder(),
                ),

                // onChanged é chamado sempre que o texto no campo é alterado
                onChanged: _atualizarTexto,

                // Define a ação do teclado como "done"
                textInputAction: TextInputAction.done,

                // onSubmitted é chamado quando o usuário envia a mensagem
                onSubmitted: enviarMensagem,

                // Finaliza a edição e remove o foco do campo
                onEditingComplete: finalizarEdicao,
              ),

              const SizedBox(height: 12),

              Text("Digitando: $textoDigitado"),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: registrarToque,
                onDoubleTap: registrarToqueDuplo,
                onLongPress: registrarToqueLongo,

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Text(
                    'Toque, toque duas vezes ou mantenha pressionado',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text('Último evento: $ultimoEvento'),
              const SizedBox(height: 8),

              Text('Toques simples: $toques'),
              Text('Toques duplos: $toquesDuplos'),
              Text('Toques longos: $toquesLongos'),

              const SizedBox(height: 12),
              
              Text('Mensagem enviada: $mensagemEnviada'),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: zerarToques,
                label: const Text('Refresh'),
                icon: const Icon(Icons.refresh),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
