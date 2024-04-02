import 'package:alarm_app/controller/provider/alarm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlarmsListWidget extends HookConsumerWidget {
  const AlarmsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          ref.read(alarmsProvider.notifier).getAlarms();
        },
      );
      return null;
    }, []);
    return Consumer(builder: (context, ref, child) {
      final alarms = ref.watch(alarmsProvider);

      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: alarms.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = ref.watch(alarmsProvider);
          return Column(
            children: [
              SizedBox(
                height: 80,
                child: ListTile(
                  tileColor: Colors.white,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[index].time,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,  
                      ),
                      Text(
                        data[index].label,
                        style: const TextStyle(fontSize: 13, color: Colors.blueGrey),
                      )
                    ],
                  ),
                  subtitleTextStyle: const TextStyle(color: Colors.grey),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const Text("Fri, Mar 31"),
                      Transform.scale(
                        scale: .70,
                        child: Switch(
                          thumbIcon: MaterialStateProperty.all(const Icon(
                            Icons.circle,
                            color: Colors.white,
                          )),
                          trackOutlineColor:
                              const MaterialStatePropertyAll(Colors.white),
                          activeColor: Colors.red,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          activeTrackColor: const Color(0xff23BA9F),
                          inactiveTrackColor:
                              const Color.fromARGB(255, 226, 231, 235),
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
