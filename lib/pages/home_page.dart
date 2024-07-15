import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/city_bloc.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/city_input_field.dart';
import '../widgets/settings_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Travel Planner')),
      body: BlocProvider(
        create: (context) => CityBloc()..add(LoadSuggestedCities()),
        child: Column(
          children: [
            BlocBuilder<CityBloc, CityState>(
              builder: (context, state) {
                if (state is CityLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CityLoaded) {
                  return CityInputField(suggestedCities: state.suggestedCities);
                } else if (state is CitySelected) {
                  return Column(
                    children: [
                      Text('Selected City: ${state.selectedCity.name}'),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BlocProvider(
                                create: (context) => SettingsBloc(),
                                child: SettingsModal(
                                  city: state.selectedCity,
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Set Travel Preferences'),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text('Error loading cities.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
