import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/travel_plan_bloc.dart';
import '../bloc/travel_plan_state.dart';
import '../models/travel_plan.dart';
import '../widgets/travel_map.dart';

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
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TravelPlanLoaded) {
                  return Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.travelPlan.days.length,
                      itemBuilder: (context, index) {
                        final day = state.travelPlan.days[index];
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Day ${day.day}'), Text(day.date)],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: day.activities.map((activity) {
                              return ListTile(
                                leading: Image.network(activity.imageUrl),
                                title: Text(activity.place),
                                subtitle: Text(activity.description),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(state.travelPlan.tips),
                      ),
                    )
                  ]);
                } else if (state is TravelPlanError) {
                  debugPrint(state.error);
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Center(child: Text('Please generate a travel plan.'));
                }
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<TravelPlanBloc, TravelPlanState>(
              builder: (context, state) {
                if (state is TravelPlanLoaded) {
                  // Collect all activities from the travel plan
                  List<Activity> allActivities = [];
                  for (var day in state.travelPlan.days) {
                    allActivities.addAll(
                        day.activities.map((activity) => activity).toList());
                  }

                  return TravelMap(activities: allActivities);
                } else {
                  return Center(child: Text('Loading map...'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
