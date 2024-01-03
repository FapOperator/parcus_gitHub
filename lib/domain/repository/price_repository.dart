import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/model/error_model.dart';
import 'package:parcus_web/model/price_model.dart';

abstract class PriceRepository {
  Future<Result<PriceModel, ErrorModel>> getAllPrice({
    required int autoPrice,
    required String selectedAuction,
    required String endCity,
    required String venLocationState,
    required String venLocationCity,
    required int capacity,
    required int year,
    required String fuelType,
    required String venType,
    required bool ifCalculategetRevisionOfDocumentsInEuropePrice,
  });
}
