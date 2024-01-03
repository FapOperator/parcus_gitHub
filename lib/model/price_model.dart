class PriceModel {
  final int feePrice;
  final int portPrice;
  final int trafficPrice;
  final int companyPrice;
  final int? complexToOdessa;
  final double ndsTotal;
  final int getBankPaymentInTheUSA;
  final int getProcentSendingMoneyToTheUSA;
  final double interestOnMoneyTransfersWithinUkrainePrice;
  final int reworkingDocumentsInTheUSAPrice;
  final int hazardFeeHibidnyElectricTrainsPrice;
  final int getUnloadingInEuropePrice;
  final int revisionOfDocumentsInEuropePrice;
  final int getCarTransporterBrokerPrice;
  final int getParkingInLvivPrice;
  final int interestOnMoneyTransfersWithinUkrainePriceInEurope;

  PriceModel({
    required this.feePrice,
    required this.portPrice,
    required this.trafficPrice,
    required this.companyPrice,
    this.complexToOdessa,
    required this.ndsTotal,
    required this.getBankPaymentInTheUSA,
    required this.getProcentSendingMoneyToTheUSA,
    required this.interestOnMoneyTransfersWithinUkrainePrice,
    required this.reworkingDocumentsInTheUSAPrice,
    required this.hazardFeeHibidnyElectricTrainsPrice,
    required this.getUnloadingInEuropePrice,
    required this.revisionOfDocumentsInEuropePrice,
    required this.getCarTransporterBrokerPrice,
    required this.getParkingInLvivPrice,
    required this.interestOnMoneyTransfersWithinUkrainePriceInEurope,
  });

  PriceModel.fromJson(Map<String, dynamic> json)
      : feePrice = json['feePrice'],
        portPrice = json['portPrice'],
        trafficPrice = json['trafficPrice'],
        ndsTotal = json['ndsTotal'],
        companyPrice = json['companyPrice'],
        complexToOdessa = json['complexToOdessa'],
        getBankPaymentInTheUSA = json['getBankPaymentInTheUSA'],
        getProcentSendingMoneyToTheUSA = json['getProcentSendingMoneyToTheUSA'],
        interestOnMoneyTransfersWithinUkrainePrice =
            json['interestOnMoneyTransfersWithinUkrainePrice'],
        reworkingDocumentsInTheUSAPrice =
            json['reworkingDocumentsInTheUSAPrice'],
        hazardFeeHibidnyElectricTrainsPrice =
            json['hazardFeeHibidnyElectricTrainsPrice'],
        getUnloadingInEuropePrice = json['getUnloadingInEuropePrice'],
        revisionOfDocumentsInEuropePrice =
            json['revisionOfDocumentsInEuropePrice'],
        getCarTransporterBrokerPrice = json['getCarTransporterBrokerPrice'],
        getParkingInLvivPrice = json['getParkingInLvivPrice'],
        interestOnMoneyTransfersWithinUkrainePriceInEurope =
            json['interestOnMoneyTransfersWithinUkrainePriceInEurope'];
}
