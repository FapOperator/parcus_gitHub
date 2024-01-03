import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parcus_web/bloc/calc/calculator_cubit.dart';
import 'package:parcus_web/domain/core/error.dart';
import 'package:parcus_web/domain/repository/auction_repository.dart';
import 'package:parcus_web/model/copart_model.dart';
import 'package:parcus_web/model/error_model.dart';

part 'info_car_state.dart';

class InfoCarCubit extends Cubit<InfoCarState> {
  final AuctionRepository _copartRepository;
  InfoCarCubit(this._copartRepository) : super(InfoCarInitial());

  resetState() {
    emit(InfoCarInitial());
  }

  getInfoCopartOrIAAIAuction(
      {required String vinCode,
      required AuctionSelected auctionSelected}) async {
    if (auctionSelected == AuctionSelected.copart) {
      final infoCar =
          await _copartRepository.getCopartInfoCar(vinCode: vinCode);
      switch (infoCar) {
        case Success(value: final copartModel):
          emit(InfoCarLoaded(copartModel: copartModel));
        case AppError(error: final error):
          emit(InfoCarError(errorModel: error));
        case Failure(exception: final exeption):
          emit(InfoCarError(errorModel: exeption));
      }
    } else if (auctionSelected == AuctionSelected.iaai) {
      final infoCar = await _copartRepository.getIaaiInfoCar(vinCode: vinCode);
      switch (infoCar) {
        case Success(value: final copartModel):
          emit(InfoCarLoaded(copartModel: copartModel));
        case AppError(error: final error):
          emit(InfoCarError(errorModel: error));
        case Failure(exception: final exeption):
          emit(InfoCarError(errorModel: exeption));
      }
    }
  }
}
