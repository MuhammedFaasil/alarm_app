import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: .1,
                color: Color.fromARGB(255, 206, 220, 236))
          ]),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next Alarm',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text('04 : 30 AM',
                style: TextStyle(
                  fontSize: 21,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              'Fri , Mar 31',
              style: TextStyle(color: Color(0xff23BA9F), fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
