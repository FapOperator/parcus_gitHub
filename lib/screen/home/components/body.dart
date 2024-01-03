import 'package:flutter/material.dart';
import 'package:parcus_web/screen/home/components/calculation_body.dart';
import 'package:parcus_web/screen/home/components/info_car.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 800,
    //   color: const Color(0xFFE7E7E7),
    //   padding: const EdgeInsets.all(16),
    //   child: Card(
    //     color: Colors.white,
    //     child: Container(
    //       child: Row(
    //         children: [
    //           Expanded(
    //               child: Column(
    //             children: [
    //               InfoCarBody(),
    //             ],
    //           )),
    //           Expanded(
    //               child: Container(
    //             color: Colors.blue,
    //           ))
    //           // Wrap(
    //           //   // crossAxisAlignment: WrapCrossAlignment.center,
    //           //   children: [
    //           //     InfoCarBody(),
    //           //     CalculationBody(),
    //           //   ],
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      color: const Color(0xFFE7E7E7),
      padding: const EdgeInsets.all(16),
      child: const Card(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              InfoCarBody(),
              CalculationBody(),
            ],
          ),
        ),
      ),
    );
  }
}
