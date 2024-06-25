import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/city.dart';

abstract class CityEvent {}

class LoadSuggestedCities extends CityEvent {}

class SelectCity extends CityEvent {
  final City city;
  SelectCity(this.city);
}

abstract class CityState {}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final List<City> suggestedCities;
  CityLoaded(this.suggestedCities);
}

class CitySelected extends CityState {
  final City selectedCity;
  CitySelected(this.selectedCity);
}

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial()) {
    on<LoadSuggestedCities>((event, emit) async {
      emit(CityLoading());
      // Fetch suggested cities (mocked here)
      await Future.delayed(const Duration(seconds: 2));
      emit(CityLoaded([City('Tokyo'), City('Kyoto'), City('Osaka')]));
    });

    on<SelectCity>((event, emit) {
      emit(CitySelected(event.city));
    });
  }
}
