import 'package:flutter/material.dart';

class ParcusAppBar extends StatelessWidget {
  final AnimationController controller;
  const ParcusAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue[400]),
              child: const Text(
                'Telegram',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
              child: const Text(
                'Viber',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              child: const Text(
                'Наш сайт',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
