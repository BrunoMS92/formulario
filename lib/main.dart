import 'dart:ffi';

import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, Outro }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String senha = '';
  bool aceitoTermos = false;
  Genero genero = Genero.Masculino;

  //Variáveis

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Página de Cadastro')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Insira seus dados',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Insira seu e-mail',
                  ),
                  onChanged: (text) {
                    if (text.contains('@')) {
                      print('Email válido');
                    } else {
                      print('Email inválido');
                    }
                    email = text;
                    //print(text);
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Insira sua senha',
                  ),
                  onChanged: (text) {
                    senha = text;
                    //print("Password $text");
                  },
                ),
                Row(
                  children: [
                    Radio(
                      value: Genero.Masculino,
                      groupValue: genero,
                      onChanged: (Genero generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado;
                        });
                      },
                    ),
                    Text('Masculino'),
                    Radio(
                      value: Genero.Feminino,
                      groupValue: genero,
                      onChanged: (Genero generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado;
                        });
                      },
                    ),
                    Text('Feminino'),
                    Radio(
                      value: Genero.Outro,
                      groupValue: genero,
                      onChanged: (Genero generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado;
                        });
                      },
                    ),
                    Text('Outro'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: aceitoTermos,
                      onChanged: (bool checked) {
                        //print(checked);
                        setState(() {
                          aceitoTermos = checked;
                        });
                      },
                    ),
                    Text('Concordo com os termos de uso do app'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Entrar pressionado');
                    print('Email $email');
                    print('Senha $senha');
                    print('Genero $genero');
                    
                    if (!aceitoTermos) {
                      print('Não aceitou os termos de uso do app');
                    }
                  },
                  child: Text('Entrar'),
                ),
                Text('Esqueceu sua senha ?'),
              ],
            ),
          )),
    );
  }
}
