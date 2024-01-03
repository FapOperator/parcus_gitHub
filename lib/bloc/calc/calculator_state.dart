part of 'calculator_cubit.dart';

enum AuctionSelected { copart, iaai }

enum PortSelected { klaipeda, odessa }

class CalculatorState extends Equatable {
  const CalculatorState({
    this.priceModel,
    this.selectedAuction,
    this.portSelected,
    this.autoPrice,
    this.totalSum,
    this.isFormTrue,
    this.venLocationState,
    this.venLocationCity,
    this.resultApi,
    this.infoCar,
    this.ifCalculategetProcentSendingMoneyToTheUSA,
    this.ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
    this.ifCalculatereworkingDocumentsInTheUSAPrice,
    this.ifCalculatehazardFeeHibidnyElectricTrainsPrice,
    this.ifCalculategetRevisionOfDocumentsInEuropePrice,
    this.ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
  });

  final AuctionSelected? selectedAuction;
  final PortSelected? portSelected;
  final int? autoPrice;
  final int? totalSum;
  final bool? isFormTrue;
  final String? venLocationState;
  final String? venLocationCity;
  final Result<PriceModel, ErrorModel>? resultApi;
  final InfoCarModel? infoCar;
  final bool? ifCalculategetProcentSendingMoneyToTheUSA;
  final bool? ifCalculateinterestOnMoneyTransfersWithinUkrainePrice;
  final bool? ifCalculatereworkingDocumentsInTheUSAPrice;
  final bool? ifCalculatehazardFeeHibidnyElectricTrainsPrice;
  final bool? ifCalculategetRevisionOfDocumentsInEuropePrice;
  final bool? ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope;

  final PriceModel? priceModel;

  static CalculatorState initial() => CalculatorState(
        selectedAuction: AuctionSelected.copart,
        portSelected: PortSelected.klaipeda,
        autoPrice: 0,
        totalSum: 0,
        isFormTrue: false,
        ifCalculategetProcentSendingMoneyToTheUSA: true,
        ifCalculateinterestOnMoneyTransfersWithinUkrainePrice: false,
        ifCalculatereworkingDocumentsInTheUSAPrice: false,
        ifCalculatehazardFeeHibidnyElectricTrainsPrice: false,
        ifCalculategetRevisionOfDocumentsInEuropePrice: false,
        ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope: false,
        priceModel: PriceModel(
          feePrice: 0,
          portPrice: 0,
          trafficPrice: 0,
          companyPrice: 0,
          ndsTotal: 0,
          getBankPaymentInTheUSA: 0,
          getProcentSendingMoneyToTheUSA: 0,
          interestOnMoneyTransfersWithinUkrainePrice: 0,
          reworkingDocumentsInTheUSAPrice: 0,
          hazardFeeHibidnyElectricTrainsPrice: 0,
          getUnloadingInEuropePrice: 0,
          revisionOfDocumentsInEuropePrice: 0,
          getCarTransporterBrokerPrice: 0,
          getParkingInLvivPrice: 0,
          interestOnMoneyTransfersWithinUkrainePriceInEurope: 0,
          complexToOdessa: 0,
        ),
      );

  @override
  List<Object?> get props => [
        selectedAuction,
        autoPrice,
        portSelected,
        priceModel,
        totalSum,
        isFormTrue,
        venLocationState,
        venLocationCity,
        resultApi,
        infoCar,
        ifCalculategetProcentSendingMoneyToTheUSA,
        ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
        ifCalculatereworkingDocumentsInTheUSAPrice,
        ifCalculatehazardFeeHibidnyElectricTrainsPrice,
        ifCalculategetRevisionOfDocumentsInEuropePrice,
        ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
      ];

  CalculatorState copyWith({
    AuctionSelected? selectedAuction,
    int? autoPrice,
    PortSelected? portSelected,
    final PriceModel? priceModel,
    int? totalSum,
    bool? isFormTrue,
    String? venLocationState,
    String? venLocationCity,
    Result<PriceModel, ErrorModel>? resultApi,
    InfoCarModel? infoCar,
    bool? ifCalculategetProcentSendingMoneyToTheUSA,
    bool? ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
    bool? ifCalculatereworkingDocumentsInTheUSAPrice,
    bool? ifCalculatehazardFeeHibidnyElectricTrainsPrice,
    bool? ifCalculategetRevisionOfDocumentsInEuropePrice,
    bool? ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
  }) {
    return CalculatorState(
      selectedAuction: selectedAuction ?? this.selectedAuction,
      portSelected: portSelected ?? this.portSelected,
      autoPrice: autoPrice ?? this.autoPrice,
      priceModel: priceModel ?? this.priceModel,
      totalSum: totalSum ?? this.totalSum,
      isFormTrue: isFormTrue ?? this.isFormTrue,
      venLocationState: venLocationState ?? this.venLocationState,
      venLocationCity: venLocationCity ?? this.venLocationCity,
      resultApi: resultApi ?? this.resultApi,
      infoCar: infoCar ?? this.infoCar,
      ifCalculategetProcentSendingMoneyToTheUSA:
          ifCalculategetProcentSendingMoneyToTheUSA ??
              this.ifCalculategetProcentSendingMoneyToTheUSA,
      ifCalculateinterestOnMoneyTransfersWithinUkrainePrice:
          ifCalculateinterestOnMoneyTransfersWithinUkrainePrice ??
              this.ifCalculateinterestOnMoneyTransfersWithinUkrainePrice,
      ifCalculatereworkingDocumentsInTheUSAPrice:
          ifCalculatereworkingDocumentsInTheUSAPrice ??
              this.ifCalculatereworkingDocumentsInTheUSAPrice,
      ifCalculatehazardFeeHibidnyElectricTrainsPrice:
          ifCalculatehazardFeeHibidnyElectricTrainsPrice ??
              this.ifCalculatehazardFeeHibidnyElectricTrainsPrice,
      ifCalculategetRevisionOfDocumentsInEuropePrice:
          ifCalculategetRevisionOfDocumentsInEuropePrice ??
              this.ifCalculategetRevisionOfDocumentsInEuropePrice,
      ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope:
          ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope ??
              this.ifCalculateinterestOnMoneyTransfersWithinUkrainePriceInEurope,
    );
  }
}
