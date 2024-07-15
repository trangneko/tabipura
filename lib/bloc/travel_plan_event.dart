import 'package:equatable/equatable.dart';
import '../models/city.dart';
import '../models/settings.dart';

abstract class TravelPlanEvent extends Equatable {
  const TravelPlanEvent();
}

class GenerateTravelPlan extends TravelPlanEvent {
  final City selectedCity;
  final TravelSettings travelSettings;

  const GenerateTravelPlan(this.selectedCity, this.travelSettings);

  @override
  List<Object> get props => [selectedCity, travelSettings];
}
