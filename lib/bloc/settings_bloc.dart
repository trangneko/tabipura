import 'package:bloc/bloc.dart';

import '../models/settings.dart';

abstract class SettingsEvent {}

class UpdateSettings extends SettingsEvent {
  final TravelSettings settings;
  UpdateSettings(this.settings);
}

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsUpdated extends SettingsState {
  final TravelSettings settings;
  SettingsUpdated(this.settings);
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<UpdateSettings>((event, emit) {
      emit(SettingsUpdated(event.settings));
    });
  }
}
