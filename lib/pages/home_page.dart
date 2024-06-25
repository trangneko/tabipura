import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/city_bloc.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/travel_plan_bloc.dart';
import '../models/city.dart';
import '../models/settings.dart';
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
                  return CircularProgressIndicator();
                } else if (state is CityLoaded) {
                  return CityInputField(suggestedCities: state.suggestedCities);
                } else if (state is CitySelected) {
                  return Text('Selected City: ${state.selectedCity.name}');
                } else {
                  return Text('Error loading cities.');
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => SettingsBloc(),
                      child: SettingsModal(),
                    );
                  },
                );
              },
              child: Text('Set Travel Preferences'),
            ),
            ElevatedButton(
              onPressed: () {
                // Assuming you've set up the required city and settings.
                City selectedCity = City('Tokyo'); // Example city
                TravelSettings travelSettings = TravelSettings(
                  travelType: 'Leisure',
                  travelTime: DateTime.now(),
                  maxCost: 1000.0,
                  travelStyle: 'Relaxed',
                );

                // Create a new TravelPlanBloc and add GenerateTravelPlan event
                context.read<TravelPlanBloc>().add(
                      GenerateTravelPlan(selectedCity, travelSettings),
                    );

                Navigator.pushNamed(context, '/result');
              },
              child: Text('Generate Travel Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
