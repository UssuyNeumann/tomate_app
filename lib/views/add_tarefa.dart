import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/moor_database.dart';

class NovaTarefa extends StatefulWidget {
  //final tarefaLista ;
  const NovaTarefa({Key key}) : super(key: key);

  @override
  _NovaTarefaState createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  DateTime novaTarefaDt;
  TextEditingController controllerTarefa;

  @override
  void initState() {
    super.initState();
    controllerTarefa = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buidTextField(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buidTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controllerTarefa,
        decoration: InputDecoration(hintText: 'qual é a nova tarefa?', focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
        onSubmitted: (inputName) {
          final database = Provider.of<AppDatabase>(context);
          final tarefa = Tarefa(
            nm_tarefa: inputName,
            dt_tarefa: novaTarefaDt, id_tarefa: null, ok_tarefa: null,
          );
          database.insertTarefa(tarefa);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  IconButton _buildDateButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () async {
          novaTarefaDt = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime(3020),
            /// inicio cor do calendário a baixo, se remover fica padrão do flutter azul
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                      primary: Color(0xffde8787),
                      primaryVariant: Color(0xffde8787)),
                  dialogBackgroundColor: Colors.greenAccent,
                  buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme
                          .primary //cor do texto no botão "OK"
                  ),
                ),
                child: child,
              );
            },
            /// fim configuração de cor do calendario
          );
        });
  }

  void resetValuesAfterSubmit() {
    setState(() {
      novaTarefaDt = null;
      controllerTarefa.clear();
    });
  }
//fim da classe
}
