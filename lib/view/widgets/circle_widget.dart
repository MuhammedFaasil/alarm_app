import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String weather;
  const CircleWidget({super.key, required this.weather});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Temperature'),
          const Text(
            '🌦️',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            '$weather ℃ ',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
