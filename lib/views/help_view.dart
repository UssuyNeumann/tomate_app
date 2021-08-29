import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff37c837)), 
        title: Text("Como Tomatar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 20, right: 16.0, bottom: 60.0),
            child: Column(
              children: <Widget>[
                Text(
                  "1 - Para iniciar o foco use o ícone de timer.",
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Viga'),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "2 - É possível iniciar o foco de 25  padrão "
                  "do pomodoro ou 35 mins. "
                  " ",
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Viga'),
                  textAlign: TextAlign.justify,
                ),
                
                SizedBox(
                  height: 2.0,
                ),
                
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "3 - Para inserir tarefas use o campo abaixo, a"
                  "data é opcional e se adicionada irá avisar, mas"
                  "é importante entender que a notificação ocorre"
                  "somente se o app ficar aberto ou minimizado.",
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Viga'),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 2.0,
                ),
                
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "4 - Apague as tarefa, apenas deslizando "
                  "para um dos lados, e clique na lixeira para "
                  "confirmar.",
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Viga'),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 2.0,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
