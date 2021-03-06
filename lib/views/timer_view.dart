import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TimerView extends StatelessWidget {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff37c837)),
        title: Text("Inciar Pomodori"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 20, right: 16.0, bottom: 60.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(scheduleNotification25.call());
                      showActionSnackbar(context);
                    },
                    child: Text('INICIAR 25 MINUTOS'),
                    color: Colors.green,
                    splashColor: Colors.red,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop(scheduleNotification35.call());
                      showActionSnackbar(context);
                    },
                    child: Text('INICIAR 35 MINUTOS'),
                    color: Colors.green,
                    splashColor: Colors.red,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffd7f4d5),
    );
  }

  //pomodori 25
  Future<void> scheduleNotification25() async {
    var scheduleNotificationDateTime =
        DateTime.now().add(Duration(seconds: 1500));
    var android = AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        enableVibration: true,
        enableLights: true,
        color: Colors.redAccent,
        icon: 'tomateapp',
        playSound: true);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Fim de foco!',
        '25 minutos, agora descanse 5 mins!',
        scheduleNotificationDateTime,
        platform,
        androidAllowWhileIdle: true);
  }

  //pomodori 35
  Future<void> scheduleNotification35() async {
    var scheduleNotificationDateTime =
        DateTime.now().add(Duration(seconds: 2100)); //2100
    var android = AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        enableVibration: true,
        enableLights: true,
        color: Colors.redAccent,
        icon: 'tomateapp',
        playSound: true);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Super foco!',
        'Uau, 35 minutos, agora descanse 5 mins!',
        scheduleNotificationDateTime,
        platform,
        androidAllowWhileIdle: true);
  }

// snackbar - configura????es
  void showActionSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text(
        'Contador silencioso iniciado',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center
      ),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

}
