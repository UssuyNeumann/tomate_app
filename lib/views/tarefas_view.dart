import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tomate_app/views/add_tarefa.dart';
import 'package:tomate_app/views/help_view.dart';
import 'package:tomate_app/views/info_view.dart';
import 'package:tomate_app/views/timer_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/moor_database.dart';
import 'package:tomate_app/views/banner_view.dart';

class TarefasView extends StatefulWidget {
  const TarefasView({Key key}) : super(key: key);

  @override
  _TarefasViewState createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  // notificacoes
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  var total = 0;
  var totalfinal = 0;

  @override
  void initState() {
    super.initState();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  } //initstate

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");

  }

  //tarefa com data de amanha não concluida
  Future<void> showNotificationDataT() async {
    var android = new AndroidNotificationDetails(
      'channel id free',
      'channel NAME',
      'CHANNEL DESCRIPTION',
      priority: Priority.High,
      importance: Importance.Max,
      enableVibration: true,
      enableLights: true,
      color: Colors.redAccent,
      onlyAlertOnce: true,
      icon: 'tomateapp',
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
      2,
      'Olá, Tomate!',
      'Existem tarefas agendadas para amanhã.',
      platform,
      payload: 'Tomate',
    );
  }

  //tarefa com data de ontem não concluida
  Future<void> showNotificationDataY() async {
    var android = new AndroidNotificationDetails(
      'channel id free',
      'channel NAME',
      'CHANNEL DESCRIPTION',
      priority: Priority.High,
      importance: Importance.Max,
      enableVibration: true,
      onlyAlertOnce: true,
      enableLights: true,
      color: Colors.redAccent,
      icon: 'tomateapp',
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
      1,
      'Olá, Tomate!',
      'Existem tarefas de ontem não concluídas.',
      platform,
      payload: 'Tomate',
    );
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }

  //recupera e mostra quantidade tarefas
  Widget _buildTextStreamBuilder() {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTarefas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active)
          return Text(
            '  Tarefas: ${snapshot.data.length}',
            style: TextStyle(
                color: Colors.redAccent,
                fontFamily: 'Handlee',
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          );
        return Text(
          '   carregando... ',
          style: TextStyle(
              color: Colors.redAccent,
              fontFamily: 'Handlee',
              fontSize: 16.0,
              fontWeight: FontWeight.w600),
        );
      },
    );
  }

  //widget do INICIO DA TELA
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //botoes do menu de opções
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.timer),
              tooltip: 'Iniciar pomodori',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerView()),
                );
              }, //_pomodoro,
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                var _firstValue = false;
                return [
                  PopupMenuItem(
                    value: 1,
                    //child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/tomateapp.png'),
                          width: 24.0,
                          height: 24.0,
                        ),
                        Text('   Pomodoro'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    //child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.help_outline),
                        Text('   Tomatando'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.thumb_up),
                        Text('   Visite'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.share),
                        Text('   Compartilhe'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.shop),
                        Text('   Remover Banner'),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoView()),
                  );
                } else if (value == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpView()),
                  );
                } else if (value == 3) {
                  curtir();
                } else if (value == 4) {
                  _onShare(context);
                } else if (value == 5) {
                  comprar();
                }
              },
            )
          ],
          actionsIconTheme: IconThemeData(color: Color(0xff37c837)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: 30.0, top: 0.0, right: 30.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Image(
                      image: AssetImage('images/tomateapp.png'),
                    ),
                    backgroundColor: Colors.transparent,
                    radius: 32.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0.0),
                        child: Text(
                          'Tomate App',
                          style: TextStyle(
                            color: Color(0xff37c837),
                            //fontFamily: 'Viga',
                            fontSize: 48.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(child: _buildTextStreamBuilder())
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.0, left: 4.0, right: 0.0, bottom: 0.0),
                margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                    color: Colors.greenAccent, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    )),
                child: _buildTarefaList(context),
              ),
            ),
            NovaTarefa(),
            Visibility(
              visible: true,
              child: BannerView(),
            )
          ],
        ),
      ),
    );
  }

  //colcoque o caminho do seu app pago na loja
  void comprar() {
    launch(
        "https://play.google.com/store/apps/details?id=com.ouricostudios.tomatei_free");
  }

  void curtir() async {
    String fbProtocolUrl = 'https://github.com/';
    String fallbackUrl = 'https://github.com/';

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  //função compartilhar
  _onShare(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(
        'https://github.com/',
        subject: "Conheça o github",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  //corpo da lista
  StreamBuilder<List<Tarefa>> _buildTarefaList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder<List<Tarefa>>(
      stream: database.watchAllTarefas(),
      //  builder: (context, AsyncSnapshot<List<Tarefa>> snapshot) {
      builder: (context, snapshot) {
        final tarefas = snapshot.data ?? List();
        total = tarefas.length;
        return ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (_, index) {
            final itemTarefa = tarefas[index];
            return _buildTarefaItem(itemTarefa, database);
          },
        );
      },
    );
  }

  Widget _buildTarefaItem(Tarefa itemTarefa, AppDatabase database) {
    var date = itemTarefa.dt_tarefa;
    var ok = itemTarefa.ok_tarefa;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    //verifica data e ok para notificar
    if (date == tomorrow && ok == false) {
      showNotificationDataT();
    } else if (date == yesterday && ok == false) {
      showNotificationDataY();
    } else {}

    // monta os item da lista com função de deslizar para apagar
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: <Widget>[
        IconSlideAction(
          caption: 'apagar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.deleteTarefa(itemTarefa),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'apagar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.deleteTarefa(itemTarefa),
        )
      ],
      child: CheckboxListTile(
        dense: true,
        title: Text(
          itemTarefa.nm_tarefa,
          style: TextStyle(
            height: 1,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          itemTarefa.dt_tarefa == null
              ? ''
              : DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                  .format(itemTarefa.dt_tarefa),
          style: TextStyle(
            height: 1,
            fontSize: 16,
            color: Colors.green,
          ),
        ),
        value: itemTarefa.ok_tarefa,
        //se for ChecboxListTile
        onChanged: (newValue) {
          database.updateTarefa(itemTarefa.copyWith(ok_tarefa: newValue));
          totalfinal = total;
        },
        activeColor: Colors.green,
      ),
    );
  }
}
