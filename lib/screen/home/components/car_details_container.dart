import 'package:flutter/material.dart';

class CarDetailsContainer extends StatelessWidget {
  final String titleContainer;
  final String infoCar;
  const CarDetailsContainer(
      {super.key, required this.titleContainer, required this.infoCar});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(5),
          child: Text(
            titleContainer,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Text(
            infoCar,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
