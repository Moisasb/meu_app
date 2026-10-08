// TELA DE CADASTRO

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Chave do formulario

  //GlobalKey é uma chave  que permite acesssar um Widget especifico e o estado associado a ele

  //<FormState> informa que esta chave será utlizada para acessar este widget form
  // O underline no inicio de _formKey indica, por ocnverção do Dart, que essa é uma variavel e privada para esse arquivo/biblioteca

  // final significa que a variavel não sera substituida por outra chave depois de criada
  final _formKey = GlobalKey<FormState>();

  // Guarda temporariamente a senha digitada
  String _senha = '';

  bool _ocultarSenha = true;

  bool _ocultarConfirmacao = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),

      // Permite rolar o conteudo caso o formulario ultrapasse a altura disponivel
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          // Form agrupa os campos que pertence ao mesmo formulario
          child: Form(
            //Key conecta este form ao _formKey criado anteriormente
            // assim podemos acessar o formState e executar as validações.
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Crie a sua conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text('Preencha os dados abaixo para continuar'),

                const SizedBox(height: 24),

                // Campos serão adicionados aqui

                // Campo do nome
                TextFormField(
                  // Configura a parte visual do campo
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    // que é parecido com o placeholder
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // validator ele recebe uma função, que executa quando chamarmos o validate() no form

                  // value é o nosso valor atual do campo
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    if (value.trim().length < 3) {
                      return ' Digite pelo menos 3 caracteres.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo de email
                TextFormField(
                  // Configura a parte visual do campo
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    // que é parecido com o placeholder
                    hintText: 'nome@exemplo.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),

                  keyboardType: TextInputType.emailAddress,

                  // validator ele recebe uma função, que executa quando chamarmos o validate() no form
                  // value é o nosso valor atual do campo
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu  email';
                    }

                    if (!value.contains('@')) {
                      return ' Digite um e-mail valido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                //Campo de senha
                TextFormField(
                  // Configura a parte visual do campo
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    // que é parecido com o placeholder
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),

                    // recebe um widget exibido no final do campo
                    // usamos o IconButton para que o usuario possa tocar no icone
                    suffixIcon: IconButton(
                      // operador  ternario escolhe qual icone sera exibido
                      icon: Icon(
                        _ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),

                      // executamos quando o usuario toca no botão
                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),

                  // recebe um bool
                  // true -> esconde os caracteres
                  // false -> mostra os caracteres

                  // como usamos a variavel _ocultarSenha, o comportamento muda quando tocamos no botão de visibilidade
                  obscureText: _ocultarSenha,

                  // chamado a cada alteração no texto do campo
                  onChanged: (value) {
                    // guardamos a senha para compara-la posteriomente com a confirmação
                    _senha = value;
                  },

                  // validator ele recebe uma função, que executa quando chamarmos o validate() no form

                  // value é o nosso valor atual do campo
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe uma senha';
                    }

                    if (value.length < 6) {
                      return ' Use pelo menos 6 caracteres.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Botão cadastrar
                SizedBox(
                  // ocupa todo espaço disponivel
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      // currentState acessa o estado  atual do form
                      // ?. executa o validate() somente se o currentState não for null
                      //?? false  vai usar o false caso o resultado seja null
                      final fomularioValidado =
                          _formKey.currentState?.validate() ?? false;

                      // se todos os validators retornarem null, o validade() retorna true

                      if (fomularioValidado) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro Validado com sucesso!'),
                          ),
                        );
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}