import 'package:alarm_app/model/alarm_entity.dart';
import 'package:alarm_app/model/alarm_model.dart';
import 'package:alarm_app/objectbox/objectbox.dart';
import 'package:alarm_app/view/page/add_alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'alarm_provider.g.dart';

@riverpod
class Alarms extends _$Alarms {
  final box = ObjectBox.instance.alarmBox;
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Alarms() {
    initializeFlutterLocalNotificationsPlugin();
  }
  void initializeFlutterLocalNotificationsPlugin() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  List<AlarmModel> build() {
    return [];
  }

  final labelController = TextEditingController();

  void addAlarms(AlarmModel model) async {
    final entity = AlarmEntity(time: model.time, label: model.label);

    await setAlarms();
    box.put(entity);
    getAlarms();
  }

  void getAlarms() {
    final alarm = box.getAll();
    final data = [
      for (var alarms in alarm)
        AlarmModel(time: alarms.time, label: alarms.label, id: alarms.id)
    ];
    state = data;
  }

  void deletAlarm(int id) {
    box.remove(id);
    getAlarms();
  }

  Future<void> setAlarms() async {
    final now = DateTime.now();
    final selectedTime = ref.watch(selectedTimeProvider);
    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Notification',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('alarm_music'),
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      5,
      'Alarm',
      ref.read(alarmsProvider.notifier).labelController.text,
      scheduledTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
