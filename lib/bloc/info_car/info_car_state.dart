part of 'info_car_cubit.dart';

sealed class InfoCarState extends Equatable {
  const InfoCarState();

  @override
  List<Object> get props => [];
}

final class InfoCarInitial extends InfoCarState {}

final class InfoCarLoading extends InfoCarState {}

final class InfoCarLoaded extends InfoCarState {
  final InfoCarModel copartModel;

  const InfoCarLoaded({required this.copartModel});

  @override
  List<Object> get props => [copartModel];
}

final class InfoCarError extends InfoCarState {
  final ErrorModel errorModel;

  const InfoCarError({required this.errorModel});
}
