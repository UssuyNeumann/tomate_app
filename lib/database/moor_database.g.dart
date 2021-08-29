// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Tarefa extends DataClass implements Insertable<Tarefa> {
  final int id_tarefa;
  final String nm_tarefa;
  final DateTime dt_tarefa;
  final bool ok_tarefa;
  Tarefa(
      {@required this.id_tarefa,
      @required this.nm_tarefa,
      this.dt_tarefa,
      @required this.ok_tarefa});
  factory Tarefa.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Tarefa(
      id_tarefa:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_tarefa']),
      nm_tarefa: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nm_tarefa']),
      dt_tarefa: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_tarefa']),
      ok_tarefa:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}ok_tarefa']),
    );
  }
  factory Tarefa.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Tarefa(
      id_tarefa: serializer.fromJson<int>(json['id_tarefa']),
      nm_tarefa: serializer.fromJson<String>(json['nm_tarefa']),
      dt_tarefa: serializer.fromJson<DateTime>(json['dt_tarefa']),
      ok_tarefa: serializer.fromJson<bool>(json['ok_tarefa']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_tarefa': serializer.toJson<int>(id_tarefa),
      'nm_tarefa': serializer.toJson<String>(nm_tarefa),
      'dt_tarefa': serializer.toJson<DateTime>(dt_tarefa),
      'ok_tarefa': serializer.toJson<bool>(ok_tarefa),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Tarefa>>(bool nullToAbsent) {
    return TarefasCompanion(
      id_tarefa: id_tarefa == null && nullToAbsent
          ? const Value.absent()
          : Value(id_tarefa),
      nm_tarefa: nm_tarefa == null && nullToAbsent
          ? const Value.absent()
          : Value(nm_tarefa),
      dt_tarefa: dt_tarefa == null && nullToAbsent
          ? const Value.absent()
          : Value(dt_tarefa),
      ok_tarefa: ok_tarefa == null && nullToAbsent
          ? const Value.absent()
          : Value(ok_tarefa),
    ) as T;
  }

  Tarefa copyWith(
          {int id_tarefa,
          String nm_tarefa,
          DateTime dt_tarefa,
          bool ok_tarefa}) =>
      Tarefa(
        id_tarefa: id_tarefa ?? this.id_tarefa,
        nm_tarefa: nm_tarefa ?? this.nm_tarefa,
        dt_tarefa: dt_tarefa ?? this.dt_tarefa,
        ok_tarefa: ok_tarefa ?? this.ok_tarefa,
      );
  @override
  String toString() {
    return (StringBuffer('Tarefa(')
          ..write('id_tarefa: $id_tarefa, ')
          ..write('nm_tarefa: $nm_tarefa, ')
          ..write('dt_tarefa: $dt_tarefa, ')
          ..write('ok_tarefa: $ok_tarefa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id_tarefa.hashCode,
      $mrjc(
          nm_tarefa.hashCode, $mrjc(dt_tarefa.hashCode, ok_tarefa.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Tarefa &&
          other.id_tarefa == id_tarefa &&
          other.nm_tarefa == nm_tarefa &&
          other.dt_tarefa == dt_tarefa &&
          other.ok_tarefa == ok_tarefa);
}

class TarefasCompanion extends UpdateCompanion<Tarefa> {
  final Value<int> id_tarefa;
  final Value<String> nm_tarefa;
  final Value<DateTime> dt_tarefa;
  final Value<bool> ok_tarefa;
  const TarefasCompanion({
    this.id_tarefa = const Value.absent(),
    this.nm_tarefa = const Value.absent(),
    this.dt_tarefa = const Value.absent(),
    this.ok_tarefa = const Value.absent(),
  });
  TarefasCompanion copyWith(
      {Value<int> id_tarefa,
      Value<String> nm_tarefa,
      Value<DateTime> dt_tarefa,
      Value<bool> ok_tarefa}) {
    return TarefasCompanion(
      id_tarefa: id_tarefa ?? this.id_tarefa,
      nm_tarefa: nm_tarefa ?? this.nm_tarefa,
      dt_tarefa: dt_tarefa ?? this.dt_tarefa,
      ok_tarefa: ok_tarefa ?? this.ok_tarefa,
    );
  }
}

class $TarefasTable extends Tarefas with TableInfo<$TarefasTable, Tarefa> {
  final GeneratedDatabase _db;
  final String _alias;
  $TarefasTable(this._db, [this._alias]);
  final VerificationMeta _id_tarefaMeta = const VerificationMeta('id_tarefa');
  GeneratedIntColumn _id_tarefa;
  @override
  GeneratedIntColumn get id_tarefa => _id_tarefa ??= _constructIdTarefa();
  GeneratedIntColumn _constructIdTarefa() {
    return GeneratedIntColumn('id_tarefa', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nm_tarefaMeta = const VerificationMeta('nm_tarefa');
  GeneratedTextColumn _nm_tarefa;
  @override
  GeneratedTextColumn get nm_tarefa => _nm_tarefa ??= _constructNmTarefa();
  GeneratedTextColumn _constructNmTarefa() {
    return GeneratedTextColumn('nm_tarefa', $tableName, false,
        minTextLength: 1, maxTextLength: 140);
  }

  final VerificationMeta _dt_tarefaMeta = const VerificationMeta('dt_tarefa');
  GeneratedDateTimeColumn _dt_tarefa;
  @override
  GeneratedDateTimeColumn get dt_tarefa => _dt_tarefa ??= _constructDtTarefa();
  GeneratedDateTimeColumn _constructDtTarefa() {
    return GeneratedDateTimeColumn(
      'dt_tarefa',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ok_tarefaMeta = const VerificationMeta('ok_tarefa');
  GeneratedBoolColumn _ok_tarefa;
  @override
  GeneratedBoolColumn get ok_tarefa => _ok_tarefa ??= _constructOkTarefa();
  GeneratedBoolColumn _constructOkTarefa() {
    return GeneratedBoolColumn('ok_tarefa', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id_tarefa, nm_tarefa, dt_tarefa, ok_tarefa];
  @override
  $TarefasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tarefas';
  @override
  final String actualTableName = 'tarefas';
  @override
  VerificationContext validateIntegrity(TarefasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_tarefa.present) {
      context.handle(_id_tarefaMeta,
          id_tarefa.isAcceptableValue(d.id_tarefa.value, _id_tarefaMeta));
    } else if (id_tarefa.isRequired && isInserting) {
      context.missing(_id_tarefaMeta);
    }
    if (d.nm_tarefa.present) {
      context.handle(_nm_tarefaMeta,
          nm_tarefa.isAcceptableValue(d.nm_tarefa.value, _nm_tarefaMeta));
    } else if (nm_tarefa.isRequired && isInserting) {
      context.missing(_nm_tarefaMeta);
    }
    if (d.dt_tarefa.present) {
      context.handle(_dt_tarefaMeta,
          dt_tarefa.isAcceptableValue(d.dt_tarefa.value, _dt_tarefaMeta));
    } else if (dt_tarefa.isRequired && isInserting) {
      context.missing(_dt_tarefaMeta);
    }
    if (d.ok_tarefa.present) {
      context.handle(_ok_tarefaMeta,
          ok_tarefa.isAcceptableValue(d.ok_tarefa.value, _ok_tarefaMeta));
    } else if (ok_tarefa.isRequired && isInserting) {
      context.missing(_ok_tarefaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_tarefa};
  @override
  Tarefa map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tarefa.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TarefasCompanion d) {
    final map = <String, Variable>{};
    if (d.id_tarefa.present) {
      map['id_tarefa'] = Variable<int, IntType>(d.id_tarefa.value);
    }
    if (d.nm_tarefa.present) {
      map['nm_tarefa'] = Variable<String, StringType>(d.nm_tarefa.value);
    }
    if (d.dt_tarefa.present) {
      map['dt_tarefa'] = Variable<DateTime, DateTimeType>(d.dt_tarefa.value);
    }
    if (d.ok_tarefa.present) {
      map['ok_tarefa'] = Variable<bool, BoolType>(d.ok_tarefa.value);
    }
    return map;
  }

  @override
  $TarefasTable createAlias(String alias) {
    return $TarefasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TarefasTable _tarefas;
  $TarefasTable get tarefas => _tarefas ??= $TarefasTable(this);
  @override
  List<TableInfo> get allTables => [tarefas];
}
