import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parcus_web/bloc/info_car/info_car_cubit.dart';
import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/domain/repository/price_repository.dart';
import 'package:parcus_web/model/copart_model.dart';
import 'package:parcus_web/model/error_model.dart';
import 'package:parcus_web/model/price_model.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  final PriceRepository _priceRepository;
  final InfoCarCubit _infoCarCubit;
  CalculatorCubit(this._priceRepository, this._infoCarCubit)
      : super(CalculatorState.initial());

  resetresultApi() {
    emit(state.copyWith(
      resultApi: Failure(ErrorModel(error: 'Введите стоимость авто')),
    ));
  }

  permissionGetInfo(
    int price,
  ) async {
    Result<PriceModel, ErrorModel> resultApi;

    if (price != 0) {
      resultApi = await getAllPrice(price);
      emit(state.copyWith(resultApi: resultApi, autoPrice: price));
      calculationTotalSum();
    }
  }

  writeInfoCar(InfoCarModel infoCar) {
    emit(state.copyWith(infoCar: infoCar));
  }

  writeVenLocation(String venLocation, String selliingBranch) {
    String venLocationState = '';
    String venLocationCity = '';

    if (state.selectedAuction == AuctionSelected.copart) {
      venLocationState = venLocation.split(' - ')[0];
      venLocationCity = venLocation.split(' - ')[1];
    } else if (state.selectedAuction == AuctionSelected.iaai) {
      if (venLocation == 'At the branch') {
        List<String> splitString = selliingBranch.split(" ");
        venLocationCity = splitString[0];
        venLocationState = splitString[1].substring(1, 3);
      } else {
        venLocationState = venLocation.split(', ')[1];
        venLocationCity = venLocation.split(', ')[0];
      }
    }
    return emit(
      state.copyWith(
        venLocationCity: venLocationCity,
        venLocationState: venLocationState,
      ),
    );
  }

  selectedAuction(AuctionSelected selectedAuction) {
    emit(CalculatorState.initial());
    emit(state.copyWith(selectedAuction: selectedAuction, autoPrice: 0));
    _infoCarCubit.resetState();
    permissionGetInfo(state.autoPrice!);
  }

  portSelected(PortSelected portSelected) {
    emit(state.copyWith(portSelected: portSelected));
    permissionGetInfo(state.autoPrice!);
  }

  getPriceAuto(String price) async {
    int intPrice = int.parse(price);
    permissionGetInfo(intPrice);
  }

  String engineConvert(String engine) {
    if (engine == 'U') {
      return 1.toString();
    }
    return (double.parse(engine.split('L')[0]) * 1000).toString();
  }

  Future<dynamic> getAllPrice(int price) async {
    List<String> splitStringModelCar = state.infoCar!.carModel.split(' ');
    String carYear = '';
    String venType = '';
    for (int i = 0; i <= splitStringModelCar.length; i++) {
      if (splitStringModelCar[i].contains('20')) {
        carYear = splitStringModelCar[i];
        break;
      }
    }
    if (state.infoCar!.venType == 'AutoMobile' ||
        state.infoCar!.venType.toUpperCase() == 'AUTOMOBILE') {
      venType = 'Auto';
    } else if (state.infoCar!.venType == 'Motorcycle') {
      venType = 'Moto';
    } else {
      venType = state.infoCar!.venType;
    }
    int capacityToInt = int.parse(engineConvert(state.infoCar!.engine));
    int carYearToInt = int.parse(carYear);
    final resultApi = await _priceRepository.getAllPrice(
      autoPrice: price,
      selectedAuction: state.selectedAuction!.name,
      endCity: state.portSelected!.name,
      venLocationCity: state.venLocationCity!,
      venLocationState: state.venLocationState!,
      capacity: capacityToInt,
      year: carYearToInt,
      fuelType: state.infoCar!.fuelType,
      venType: venType,
      ifCalculategetRevisionOfDocumentsInEuropePrice:
          state.ifCalculategetRevisionOfDocumentsInEuropePrice ?? false,
    );
    return resultApi;
  }

  calculationTotalSum() {
    switch (state.resultApi) {
      case Success(value: final priceModel):
        {
          int totalSum = (state.autoPrice)! +
              (priceModel.feePrice) +
              (priceModel.complexToOdessa ?? 0) +
              (priceModel.trafficPrice) +
              (priceModel.portPrice) +
              (priceModel.companyPrice) +
              (priceModel.ndsTotal).toInt() +
              (priceModel.getBankPaymentInTheUSA) +
              (priceModel.getCarTransporterBrokerPrice) +
              (priceModel.getParkingInLvivPrice) +
              (state.ifCalculategetProcentSendingMoneyToTheUSA!
                  ? (priceModel.getProcentSendingMoneyToTheUSA)
                  : 0) +
              (priceModel.getUnloadingInEuropePrice) +
              (state.ifCalculatehazardFeeHibidnyElectricTrainsPrice!
                  ? (priceModel.hazardFeeHibidnyElectricTrainsPrice)
                  : 0) +
              (state.ifCalculateinterestOnMoneyTransfersWithinUkrainePrice!
                  ? (priceModel.interestOnMoneyTransfersWithinUkrainePrice
                      .toInt())
                  : 0) +
              (state.ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope!
                  ? (priceModel
                      .interestOnMoneyTransfersWithinUkrainePriceInEurope)
                  : 0) +
              (state.ifCalculategetRevisionOfDocumentsInEuropePrice!
                  ? (priceModel.revisionOfDocumentsInEuropePrice)
                  : 0) +
              (state.ifCalculatereworkingDocumentsInTheUSAPrice!
                  ? (priceModel.reworkingDocumentsInTheUSAPrice)
                  : 0);
          emit(state.copyWith(totalSum: totalSum));
        }
      default:
        0;
    }
  }

  toogleCalculategetProcentSendingMoneyToTheUSA(bool value) {
    emit(state.copyWith(ifCalculategetProcentSendingMoneyToTheUSA: value));
    calculationTotalSum();
  }

  toogleCalculateinterestOnMoneyTransfersWithinUkrainePrice(bool value) {
    emit(state.copyWith(
        ifCalculateinterestOnMoneyTransfersWithinUkrainePrice: value));
    calculationTotalSum();
  }

  toogleCalculatereworkingDocumentsInTheUSAPrice(bool value) {
    emit(state.copyWith(ifCalculatereworkingDocumentsInTheUSAPrice: value));
    calculationTotalSum();
  }

  toogleCalculatehazardFeeHibidnyElectricTrainsPrice(bool value) {
    emit(state.copyWith(ifCalculatehazardFeeHibidnyElectricTrainsPrice: value));
    calculationTotalSum();
  }

  toogleCalculategetRevisionOfDocumentsInEuropePrice(bool value) async {
    emit(state.copyWith(ifCalculategetRevisionOfDocumentsInEuropePrice: value));

    final resultApi = await getAllPrice(state.autoPrice!);
    emit(state.copyWith(resultApi: resultApi));
    calculationTotalSum();
  }

  toogleCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope(
      bool value) {
    emit(state.copyWith(
        ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope: value));
    calculationTotalSum();
  }
}
