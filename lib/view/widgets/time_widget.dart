import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String time;
  const TimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:const [
            BoxShadow(
                spreadRadius: .5,
                blurRadius: 5,
                color: Color.fromARGB(255, 206, 220, 236))
          ],
          borderRadius: BorderRadius.circular(100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Click to change time',
            style: TextStyle(fontSize: 8),
          ),
          Center(
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 35,
                color: Color(0xff23BA9F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
