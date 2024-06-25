import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/travel_plan_bloc.dart';
import '../widgets/travel_map.dart';
import '../widgets/travel_route.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Plan Result')),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: BlocBuilder<TravelPlanBloc, TravelPlanState>(
              builder: (context, state) {
                if (state is TravelPlanLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TravelPlanLoaded) {
                  return TravelRoute(route: state.travelPlan.suggestedRoute);
                } else if (state is TravelPlanError) {
                  return Center(child: Text(state.error));
                } else {
                  return Center(child: Text('No travel plan available.'));
                }
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: TravelMap(),
          ),
        ],
      ),
    );
  }
}
