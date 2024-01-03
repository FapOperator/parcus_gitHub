import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:parcus_web/bloc/calc/calculator_cubit.dart';
import 'package:parcus_web/bloc/info_car/info_car_cubit.dart';
import 'package:parcus_web/domain/core/api_client.dart';
import 'package:parcus_web/infostructure/repositories/auction_repository_impl.dart';
import 'package:parcus_web/infostructure/repositories/price_repository_impl.dart';
import 'package:parcus_web/screen/home/home.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const ParcusWeb());
}

class ParcusWeb extends StatelessWidget {
  const ParcusWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: darkBlue, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  InfoCarCubit(AuctionRepositoryImpl(ApiClient(Client()))),
            ),
            BlocProvider(
              create: (context) => CalculatorCubit(
                  PriceRepositoryImpl(ApiClient(Client())),
                  context.read<InfoCarCubit>()),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
