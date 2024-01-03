import 'package:parcus_web/domain/core/api_client.dart';
import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/domain/repository/auction_repository.dart';
import 'package:parcus_web/model/copart_model.dart';
import 'package:parcus_web/model/error_model.dart';

class AuctionRepositoryImpl extends AuctionRepository {
  final ApiClient _client;

  AuctionRepositoryImpl(this._client);
  @override
  Future<Result<InfoCarModel, ErrorModel>> getCopartInfoCar(
      {required String vinCode}) async {
    try {
      final response = await _client.get(
        vinCode,
        isParsing: true,
        params: <String, dynamic>{
          "vinCode": vinCode,
        },
      ) as Map<String, dynamic>;
      final result = InfoCarModel.fromJson(response);
      return Success(result);
    } on ServerException catch (error) {
      return AppError(ErrorModel.fromJson(error.erorr));
    } on Exception {
      return Failure(ErrorModel(error: 'Somesing went wrong:('));
    }
  }

  @override
  Future<Result<InfoCarModel, ErrorModel>> getIaaiInfoCar(
      {required String vinCode}) async {
    try {
      final response = await _client.get(
        'http://calc.parcus.us/iaai.json',
        isParsing: true,
        params: <String, dynamic>{
          "vinCode": vinCode,
        },
      ) as Map<String, dynamic>;
      final result = InfoCarModel.fromJson(response);
      return Success(result);
    } on ServerException catch (error) {
      return AppError(ErrorModel.fromJson(error.erorr));
    } on Exception {
      return Failure(ErrorModel(error: 'Somesing went wrong:('));
    }
  }
}
