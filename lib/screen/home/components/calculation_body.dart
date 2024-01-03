import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcus_web/bloc/calc/calculator_cubit.dart';
import 'package:parcus_web/bloc/info_car/info_car_cubit.dart';
import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/model/custom_radio_model.dart';
import 'package:parcus_web/screen/home/components/calc_price_container.dart';
import 'package:parcus_web/screen/home/components/custum_radio_button.dart';

class CalculationBody extends StatefulWidget {
  const CalculationBody({
    super.key,
  });

  @override
  State<CalculationBody> createState() => _CalculationBodyState();
}

class _CalculationBodyState extends State<CalculationBody> {
  final focus = FocusNode();
  TextEditingController coastController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String coastControllerCopy = '';

    return Container(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 1000),
      child: Wrap(
        children: [
          BlocBuilder<InfoCarCubit, InfoCarState>(
              builder: (context, infoCarstate) {
            coastController.text = '';
            coastControllerCopy = '';

            if (infoCarstate is InfoCarLoaded) {
              context
                  .read<CalculatorCubit>()
                  .writeInfoCar(infoCarstate.copartModel);
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Порт доставки',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioButton<PortSelected>(
                        onChange: (PortSelected index) {
                          context.read<CalculatorCubit>().portSelected(index);
                        },
                        buttonList: [
                          CustomRadioModel<PortSelected>(
                            assetName: 'assets/copartlogo.svg',
                            index: PortSelected.klaipeda,
                            hintText: 'Клейпада',
                          ),
                          CustomRadioModel<PortSelected>(
                            assetName: 'assets/copartlogo.svg',
                            index: PortSelected.odessa,
                            hintText: 'Одесса',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    // constraints:
                    //     const BoxConstraints(minWidth: 50, maxWidth: 200),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: TextFormField(
                      focusNode: focus,
                      keyboardType: TextInputType.number,
                      controller: coastController,
                      onEditingComplete: () {
                        if (coastControllerCopy != coastController.text) {
                          coastControllerCopy = coastController.text;
                          context.read<CalculatorCubit>().writeVenLocation(
                                infoCarstate.copartModel.venLocation,
                                infoCarstate.copartModel.selliingBranch,
                              );
                          context
                              .read<CalculatorCubit>()
                              .getPriceAuto(coastController.text);
                        } else {
                          coastControllerCopy = coastController.text;
                        }
                      },
                      onTapOutside: (event) {
                        if (coastController.text.isNotEmpty &&
                            coastControllerCopy != coastController.text) {
                          coastControllerCopy = coastController.text;
                          context
                              .read<CalculatorCubit>()
                              .getPriceAuto(coastController.text);
                        } else {
                          coastControllerCopy = coastController.text;
                        }
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        counterStyle: const TextStyle(color: Colors.black),
                        labelText: 'Стоимость авто',
                        filled: false,
                        labelStyle: const TextStyle(color: Colors.black),
                        fillColor: Colors.grey[200],
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                      ),
                    ),
                  ),
                  BlocBuilder<CalculatorCubit, CalculatorState>(
                    builder: (context, state) {
                      switch (state.resultApi) {
                        case AppError(error: final error):
                          return Text(
                            error.error,
                            style: const TextStyle(color: Colors.black),
                          );
                        case Failure(exception: final exception):
                          return Text(
                            exception.error,
                            style: const TextStyle(color: Colors.black),
                          );
                        case Success(value: final price):
                          return Container(
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 1000),
                            child: Wrap(
                              children: [
                                Column(
                                  children: [
                                    CalcPriceContainer(
                                      price: state.totalSum.toString(),
                                      title: 'Итого: ',
                                    ),
                                    CalcPriceContainer(
                                      price: price.feePrice.toString(),
                                      title: 'Аукционный сбор: ',
                                    ),
                                    CalcPriceContainer(
                                      price: price.trafficPrice.toString(),
                                      title: 'Стоимость наземной доставки: ',
                                    ),
                                    CalcPriceContainer(
                                      price: price.portPrice.toString(),
                                      title: 'Морской фрахт: ',
                                    ),
                                    CalcPriceContainer(
                                      price: price.companyPrice.toString(),
                                      title: 'Комиссия компании: ',
                                    ),
                                    CalcPriceContainer(
                                      price: price.ndsTotal.toString(),
                                      title: 'Таможенные платежи: ',
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CalcPriceContainer(
                                      price: price.getBankPaymentInTheUSA
                                          .toString(),
                                      title: 'Банковская Платежка по США: ',
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CalcPriceContainer(
                                            price: state
                                                    .ifCalculategetProcentSendingMoneyToTheUSA!
                                                ? price
                                                    .getProcentSendingMoneyToTheUSA
                                                    .toString()
                                                : price
                                                    .getProcentSendingMoneyToTheUSA
                                                    .toString(),
                                            title:
                                                '% за отправку денег в США: ',
                                            isStrokeText: state
                                                .ifCalculategetProcentSendingMoneyToTheUSA,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: 2.0,
                                                      color: Colors
                                                          .blueGrey.shade900),
                                                ),
                                                semanticLabel: 'Учитывать',
                                                value: state
                                                    .ifCalculategetProcentSendingMoneyToTheUSA,
                                                onChanged: (value) {
                                                  context
                                                      .read<CalculatorCubit>()
                                                      .toogleCalculategetProcentSendingMoneyToTheUSA(
                                                          value!);
                                                }),
                                            const Text(
                                              'Учитывать в "ИТОГО"',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CalcPriceContainer(
                                            isStrokeText: state
                                                .ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
                                            price: price
                                                .interestOnMoneyTransfersWithinUkrainePrice
                                                .toString(),
                                            title:
                                                '% за перевод денег по Украине: ',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: 2.0,
                                                      color: Colors
                                                          .blueGrey.shade900),
                                                ),
                                                value: state
                                                    .ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
                                                onChanged: (value) {
                                                  context
                                                      .read<CalculatorCubit>()
                                                      .toogleCalculateinterestOnMoneyTransfersWithinUkrainePrice(
                                                          value!);
                                                }),
                                            const Text(
                                              'Учитывать в "ИТОГО"',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CalcPriceContainer(
                                            isStrokeText: state
                                                .ifCalculatereworkingDocumentsInTheUSAPrice,
                                            price: price
                                                .reworkingDocumentsInTheUSAPrice
                                                .toString(),
                                            title:
                                                'Переделка Документов в США: ',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: 2.0,
                                                      color: Colors
                                                          .blueGrey.shade900),
                                                ),
                                                value: state
                                                    .ifCalculatereworkingDocumentsInTheUSAPrice,
                                                onChanged: (value) {
                                                  context
                                                      .read<CalculatorCubit>()
                                                      .toogleCalculatereworkingDocumentsInTheUSAPrice(
                                                          value!);
                                                }),
                                            const Text(
                                              'Учитывать в "ИТОГО"',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CalcPriceContainer(
                                            price: price
                                                .hazardFeeHibidnyElectricTrainsPrice
                                                .toString(),
                                            title:
                                                'Hazard Fee Гибриды/Електрички: ',
                                            isStrokeText: state
                                                .ifCalculatehazardFeeHibidnyElectricTrainsPrice,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: 2.0,
                                                      color: Colors
                                                          .blueGrey.shade900),
                                                ),
                                                value: state
                                                    .ifCalculatehazardFeeHibidnyElectricTrainsPrice,
                                                onChanged: (value) {
                                                  context
                                                      .read<CalculatorCubit>()
                                                      .toogleCalculatehazardFeeHibidnyElectricTrainsPrice(
                                                          value!);
                                                }),
                                            const Text(
                                              'Учитывать в "ИТОГО"',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    price.complexToOdessa != 0
                                        ? CalcPriceContainer(
                                            price: price.complexToOdessa
                                                .toString(),
                                            title: 'Комплекс до Одессы: ',
                                          )
                                        : Column(
                                            children: [
                                              CalcPriceContainer(
                                                price: price
                                                    .getUnloadingInEuropePrice
                                                    .toString(),
                                                title: 'Выгрузка в Европе: ',
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: CalcPriceContainer(
                                                      price: price
                                                          .revisionOfDocumentsInEuropePrice
                                                          .toString(),
                                                      title:
                                                          'Пределка Документов в Европе: ',
                                                      isStrokeText: state
                                                          .ifCalculategetRevisionOfDocumentsInEuropePrice,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                          side:
                                                              MaterialStateBorderSide
                                                                  .resolveWith(
                                                            (states) => BorderSide(
                                                                width: 2.0,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade900),
                                                          ),
                                                          value: state
                                                              .ifCalculategetRevisionOfDocumentsInEuropePrice,
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    CalculatorCubit>()
                                                                .toogleCalculategetRevisionOfDocumentsInEuropePrice(
                                                                    value!);
                                                          }),
                                                      const Text(
                                                        'Учитывать в "ИТОГО"',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              CalcPriceContainer(
                                                price: price
                                                    .getCarTransporterBrokerPrice
                                                    .toString(),
                                                title: 'Автовоз+Брокер: ',
                                              ),
                                              CalcPriceContainer(
                                                price: price
                                                    .getParkingInLvivPrice
                                                    .toString(),
                                                title: 'Стоянка во Львове: ',
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: CalcPriceContainer(
                                                      price: price
                                                          .interestOnMoneyTransfersWithinUkrainePriceInEurope
                                                          .toString(),
                                                      title:
                                                          '% за перевод денег по Украине: ',
                                                      isStrokeText: state
                                                          .ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                          side:
                                                              MaterialStateBorderSide
                                                                  .resolveWith(
                                                            (states) => BorderSide(
                                                                width: 2.0,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade900),
                                                          ),
                                                          value: state
                                                              .ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    CalculatorCubit>()
                                                                .toogleCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope(
                                                                    value!);
                                                          }),
                                                      const Text(
                                                        'Учитывать в "ИТОГО"',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          );

                        default:
                          return Container(
                            constraints: const BoxConstraints(
                                minWidth: 100, maxWidth: 400),
                          );
                      }
                    },
                  ),
                ],
              );
            } else if (infoCarstate is InfoCarInitial) {
              return Container();
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
