import 'package:flutter/material.dart';

class AlarmsListWidget extends StatelessWidget {
  const AlarmsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '04:30',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Label text',
                    style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                  )
                ],
              ),
              subtitleTextStyle: const TextStyle(color: Colors.grey),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Fri, Mar 31"),
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
          ],
        );
      },
    );
  }
}
