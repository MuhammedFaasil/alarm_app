import 'package:alarm_app/controller/services/api_services.dart';
import 'package:alarm_app/view/page/add_alarm_page.dart';
import 'package:alarm_app/view/widgets/alarm_list_widget.dart';
import 'package:alarm_app/view/widgets/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlarmHomePage extends HookConsumerWidget {
  const AlarmHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiServices = ApiServices();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Alarm'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: apiServices.getWeather(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final currentWeather = snapshot.data;
                  return CircleWidget(
                    weather: currentWeather!,
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xffF6F8F9),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'ALARMS',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AlarmsListWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff23BA9F),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddAlarmPage(),
              ));
        },
        label: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
