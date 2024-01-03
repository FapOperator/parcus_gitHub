import 'package:parcus_web/domain/core/api_client.dart';
import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/domain/repository/price_repository.dart';
import 'package:parcus_web/model/error_model.dart';
import 'package:parcus_web/model/price_model.dart';

class PriceRepositoryImpl extends PriceRepository {
  final ApiClient _client;

  PriceRepositoryImpl(this._client);

  @override
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
  }) async {
    try {
      final response = await _client.post(
        'main',
        params: <String, dynamic>{
          "autoPrice": autoPrice,
          "selectedAuction": selectedAuction,
          "endCity": endCity,
          "venLocationState": venLocationState,
          "venLocationCity": venLocationCity,
          "capacity": capacity,
          "year": year,
          "fuelType": fuelType,
          "venType": venType,
          "ifCalculategetRevisionOfDocumentsInEuropePrice":
              ifCalculategetRevisionOfDocumentsInEuropePrice,
        },
      );
      final result = PriceModel.fromJson(response);
      return Success(result);
    } on ServerException catch (error) {
      return AppError(ErrorModel.fromJson(error.erorr));
    } on Exception {
      return Failure(ErrorModel(error: 'Somesing went wrong:('));
    }
  }
}
