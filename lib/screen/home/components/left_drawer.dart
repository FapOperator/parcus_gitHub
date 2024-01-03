import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF2C3C56),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF223047),
            child: const Text('PARCUS'),
          ),
          Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 30),
              child: const Text('Инструменты',
                  style: TextStyle(
                    color: Colors.white54,
                  ))),
          _tile('Калькулятор'),
        ],
      ),
    );
  }

  Widget _tile(String label) {
    return ListTile(
      title: Text(label),
      onTap: () {},
    );
  }
}
