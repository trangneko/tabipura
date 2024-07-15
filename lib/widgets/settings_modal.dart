import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/travel_plan_bloc.dart';
import '../bloc/travel_plan_event.dart';
import '../models/city.dart';
import '../models/settings.dart';

class SettingsModal extends StatefulWidget {
    final City city;

  const SettingsModal({super.key, required this.city});

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  final _formKey = GlobalKey<FormState>();
  String _travelType = 'Friends';
  DateTime _dateStart = DateTime(2024, 7, 15);
  DateTime _dateEnd = DateTime(2024, 7, 16);
  String _budgetType = 'Low';
  String _travelStyle = 'Relaxed';
  String _interest = 'Nature';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _travelType,
              onChanged: (value) {
                setState(() {
                  _travelType = value!;
                });
              },
              items: ['Friends', 'Couple', 'Solo', 'Business'].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Travel Type'),
            ),
            DropdownButtonFormField<String>(
              value: _budgetType,
              onChanged: (value) {
                setState(() {
                  _budgetType = value!;
                });
              },
              items: ['Low', 'Medium', 'High'].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Budget Type'),
            ),
            DropdownButtonFormField<String>(
              value: _travelStyle,
              onChanged: (value) {
                setState(() {
                  _travelStyle = value!;
                });
              },
              items: ['Relaxed', 'Normal', 'Adventurous', 'Packed'].map((style) {
                return DropdownMenuItem(
                  value: style,
                  child: Text(style),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Travel Style'),
            ),
            DropdownButtonFormField<String>(
              value: _interest,
              onChanged: (value) {
                setState(() {
                  _interest = value!;
                });
              },
              items: ['Nature', 'Museums', 'Constructs', 'Art'].map((style) {
                return DropdownMenuItem(
                  value: style,
                  child: Text(style),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Interests'),
            ),
            ElevatedButton(
              onPressed: () {
                final settings = TravelSettings(
                  dateStart: _dateStart,
                  dateEnd: _dateEnd,
                  travelType: _travelType,
                  budgetType: _budgetType,
                  travelStyle: _travelStyle, 
                  interest: _interest
                );
              context.read<TravelPlanBloc>().add(
                    GenerateTravelPlan(widget.city, settings),
                  );

              Navigator.pop(context);
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
