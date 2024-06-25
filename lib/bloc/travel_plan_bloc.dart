import 'package:bloc/bloc.dart';

import '../models/city.dart';
import '../models/travel_plan.dart';
import '../models/settings.dart';

abstract class TravelPlanEvent {}

class GenerateTravelPlan extends TravelPlanEvent {
  final City city;
  final TravelSettings settings;
  GenerateTravelPlan(this.city, this.settings);
}

abstract class TravelPlanState {}

class TravelPlanInitial extends TravelPlanState {}

class TravelPlanLoading extends TravelPlanState {}

class TravelPlanLoaded extends TravelPlanState {
  final TravelPlan travelPlan;
  TravelPlanLoaded(this.travelPlan);
}

class TravelPlanError extends TravelPlanState {
  final String error;
  TravelPlanError(this.error);
}

class TravelPlanBloc extends Bloc<TravelPlanEvent, TravelPlanState> {
  TravelPlanBloc() : super(TravelPlanInitial()) {
    on<GenerateTravelPlan>((event, emit) async {
      emit(TravelPlanLoading());
      // Simulate API call to generate travel plan
      await Future.delayed(Duration(seconds: 2));
      emit(TravelPlanLoaded(TravelPlan(['Place 1', 'Place 2', 'Place 3'])));
    });
  }
}
