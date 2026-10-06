// TELA DE CADASTRO

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Chave de formulário para validar os campos

  // GlobalKey é uma chave que permite acessar o estado de um widget em qualquer lugar do código, mesmo fora da árvore de widgets. Ela é útil para validar formulários, controlar animações e gerenciar estados complexos.

  // FormState é uma classe que representa o estado de um formulário. Ela fornece métodos para validar, salvar e resetar os campos do formulário. Através do FormState, podemos acessar os valores dos campos e verificar se eles são válidos.

  // O underline (_) antes do nome da variável indica que ela é privada, ou seja, só pode ser acessada dentro da classe onde foi declarada.

  // final indica que a variável não poderá receber outro valor depois de inicializada.
  final _formKey = GlobalKey<FormState>();

  // Guarda temporariamente a senha digitada
  String senha = '';

  bool _ocultarSenha = true;

  bool _ocultarConfirmacao = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        // Permite rolar o conteúdo da tela quando o teclado é exibido,
        // evitando que os campos fiquem escondidos.
        child: Padding(
          padding: const EdgeInsets.all(16),

          // Adiciona um espaçamento interno de 16 pixels em todos
          // os lados do conteúdo da tela.
          child: Form(
            // Key conectada ao formulário para validar os campos.
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Crie a sua conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Preencha os dados abaixo para continuar',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 24),

                // CAMPO DE NOME
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    // É parecido com placeholder.
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // Validação do campo de nome
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    // O método trim() remove espaços em branco
                    // no início e no final da string.
                    if (value.trim().length < 3) {
                      return 'Nome deve ter no mínimo 3 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // CAMPO DE EMAIL
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite seu email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu email';
                    }

                    // Validação simples de email
                    if (!value.contains('@')) {
                      return 'Informe um email válido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // CAMPO DE SENHA
                TextFormField(
                  // obscureText: true, // Oculta o texto digitado
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    // é parecido com placeholder.
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),

                    // recebe um widget que será exibido no final do campo de texto, dentro da borda.
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                    // O onPressed é um callback que será chamado quando o botão for pressionado.
                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),
                    // recebe um bool
                    // true -> Oculta o texto digitado
                    // false -> Exibe o texto digitado
                  obscureText: _ocultarSenha,
                    // Como usamos a variavel _ocultarSenha para controlar a visibilidade da senha, precisamos atualizar o estado do widget quando o botão de visibilidade for pressionado. Para isso, usamos o setState(), que notifica o Flutter que o estado do widget mudou e que ele precisa ser reconstruído.   
                  
                    // O onChanged é um callback que será chamado sempre que o valor do campo mudar. Ele recebe o novo valor como parâmetro.
                  onChanged: (value) {
                    // Atualiza a variável senha com o valor digitado
                    senha = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
