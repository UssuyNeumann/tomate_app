import 'dart:async';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';


class Tarefas extends Table {
  // incluindo o autoIncrement() a coluna vira uma Primary Key
  IntColumn get id_tarefa => integer().autoIncrement()();
  TextColumn get nm_tarefa => text().withLength(min: 1, max: 140)();
  DateTimeColumn get dt_tarefa => dateTime().nullable()();
  BoolColumn get ok_tarefa => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Tarefas], )
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'tomate_app.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Tarefa>> getAllTarefas() {
    return select(tarefas).get();
  }
  Stream<List<Tarefa>> watchAllTarefas() {
    return select(tarefas).watch();
  }
  Future insertTarefa(Tarefa tarefa) => into(tarefas).insert(tarefa);
  Future updateTarefa(Tarefa tarefa) => update(tarefas).replace(tarefa);
  Future deleteTarefa(Tarefa tarefa) => delete(tarefas).delete(tarefa);
  Stream<List<Tarefa>> countAllTarefas() {
    return select(tarefas).watch();
  }


  Stream<List<Tarefa>> watchOkTarefas() {
    // where returns void, need to use the cascading operator
    return (select(tarefas)
      ..orderBy(
        ([
          // Primary sorting by due date
              (t) =>
              OrderingTerm(expression: t.dt_tarefa, mode: OrderingMode.desc),
          // Secondary alphabetical sorting
              (t) => OrderingTerm(expression: t.nm_tarefa),
        ]),
      )
      ..where((t) => t.ok_tarefa.equals(true)))
        .watch();
  }
}



