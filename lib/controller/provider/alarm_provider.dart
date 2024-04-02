import 'package:alarm_app/model/alarm_entity.dart';
import 'package:alarm_app/model/alarm_model.dart';
import 'package:alarm_app/objectbox/objectbox.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alarm_provider.g.dart';

@riverpod
class Alarms extends _$Alarms {
  final box = ObjectBox.instance.alarmBox;
  Alarms() {}

  @override
  List<AlarmModel> build() {
    return [];
  }

  final labelController = TextEditingController();

  void addAlarms(AlarmModel model) async {
    final entity = AlarmEntity(time: model.time, label: model.label);
    box.put(entity);
  }

  void getAlarms() {
    final alarm = box.getAll();
    final data = [
      for (var alarms in alarm)
        AlarmModel(time: alarms.time, label: alarms.label, id: alarms.id)
    ];
    state = data;
  }
}
