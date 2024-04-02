import 'package:alarm_app/controller/provider/alarm_provider.dart';
import 'package:alarm_app/model/alarm_model.dart';
import 'package:alarm_app/view/widgets/textfield_wdget.dart';
import 'package:alarm_app/view/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final selectedTimeProvider = StateProvider<TimeOfDay>((ref) => TimeOfDay.now());

class AddAlarmPage extends HookConsumerWidget {
  const AddAlarmPage({super.key});

  Future<void> selectTime(BuildContext context, WidgetRef ref) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: ref.watch(selectedTimeProvider),
    );
    if (pickedTime != null) {
      ref.read(selectedTimeProvider.notifier).state = pickedTime;
    }
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Alarm',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                final labelController =
                    ref.read(alarmsProvider.notifier).labelController;
                labelController.clear();
                ref.read(alarmsProvider.notifier).addAlarms(AlarmModel(
                    time: formatTimeOfDay(
                        ref.read(selectedTimeProvider.notifier).state),
                    label: labelController.text));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: InkWell(
              onTap: () {
                selectTime(context, ref);
              },
              child: TimeWidget(
                time: ref
                    .read(selectedTimeProvider.notifier)
                    .state
                    .format(context),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          TextFieldWidget(
            controller: ref.read(alarmsProvider.notifier).labelController,
          )
        ],
      ),
    );
  }
}
