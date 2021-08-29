import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff37c837)),
        title: Text("Informações"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 20, right: 16.0, bottom: 60.0),
            child: Column(
              children: <Widget>[
                Text(
                  "     A Técnica Pomodoro de gerenciamento de tempo sugere: "
                  "listar tarefas e realizar em tempos de 25 mins em foco sem "
                  "interrupções, e após ter pausas de 5 mins e uma pausa maior ao final "
                  "de 4 tempos, assim aumentando o seu foco e sua produtividade.",
                  style: TextStyle(fontSize: 14.0, fontFamily: 'Viga'),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Image.asset(
                  'images/pomodoro.png',
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffd7f4d5),
    );
  }
}
