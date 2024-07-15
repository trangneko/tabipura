import 'package:bloc/bloc.dart';
import '../services/api_service.dart';
import 'travel_plan_event.dart';
import 'travel_plan_state.dart';

class TravelPlanBloc extends Bloc<TravelPlanEvent, TravelPlanState> {
  final ApiService apiService;

  TravelPlanBloc(this.apiService) : super(TravelPlanInitial()) {
    // Register the event handler
    on<GenerateTravelPlan>(_onGenerateTravelPlan);
  }

  Future<void> _onGenerateTravelPlan(
    GenerateTravelPlan event,
    Emitter<TravelPlanState> emit,
  ) async {
    emit(TravelPlanLoading());
    try {
      final travelPlan = await apiService.fetchTravelPlan(
        event.selectedCity,
        event.travelSettings,
      );
      emit(TravelPlanLoaded(travelPlan));
    } catch (e) {
      emit(TravelPlanError(e.toString()));
    }
  }
}
