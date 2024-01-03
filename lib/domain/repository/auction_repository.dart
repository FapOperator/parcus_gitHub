import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/model/copart_model.dart';
import 'package:parcus_web/model/error_model.dart';

abstract class AuctionRepository {
  Future<Result<InfoCarModel, ErrorModel>> getCopartInfoCar({
    required String vinCode,
  });
  Future<Result<InfoCarModel, ErrorModel>> getIaaiInfoCar({
    required String vinCode,
  });
}
