import 'package:flutter/material.dart';

class CalcPriceContainer extends StatelessWidget {
  final String price;
  final String title;
  final bool? isStrokeText;
  const CalcPriceContainer({
    super.key,
    required this.price,
    required this.title,
    this.isStrokeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              decoration:
                  isStrokeText ?? true ? null : TextDecoration.lineThrough,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '$price\$',
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
