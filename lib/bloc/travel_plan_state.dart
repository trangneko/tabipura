import 'package:equatable/equatable.dart';
import '../models/travel_plan.dart';

abstract class TravelPlanState extends Equatable {
  const TravelPlanState();

  @override
  List<Object> get props => [];
}

class TravelPlanInitial extends TravelPlanState {}

class TravelPlanLoading extends TravelPlanState {}

class TravelPlanLoaded extends TravelPlanState {
  final TravelPlan travelPlan;

  const TravelPlanLoaded(this.travelPlan);

  @override
  List<Object> get props => [travelPlan];
}

class TravelPlanError extends TravelPlanState {
  final String error;

  const TravelPlanError(this.error);

  @override
  List<Object> get props => [error];
}
