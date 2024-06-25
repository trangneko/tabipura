import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';
import '../models/settings.dart';

class SettingsModal extends StatefulWidget {
  const SettingsModal({super.key});

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  final _formKey = GlobalKey<FormState>();
  String _travelType = 'Leisure';
  DateTime _travelTime = DateTime.now();
  double _maxCost = 1000.0;
  String _travelStyle = 'Relaxed';

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
              items: ['Leisure', 'Business'].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Travel Type'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Max Cost'),
              keyboardType: TextInputType.number,
              initialValue: _maxCost.toString(),
              onChanged: (value) {
                _maxCost = double.parse(value);
              },
            ),
            DropdownButtonFormField<String>(
              value: _travelStyle,
              onChanged: (value) {
                setState(() {
                  _travelStyle = value!;
                });
              },
              items: ['Relaxed', 'Adventurous'].map((style) {
                return DropdownMenuItem(
                  value: style,
                  child: Text(style),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Travel Style'),
            ),
            ElevatedButton(
              onPressed: () {
                final settings = TravelSettings(
                  travelType: _travelType,
                  travelTime: _travelTime,
                  maxCost: _maxCost,
                  travelStyle: _travelStyle,
                );
                context.read<SettingsBloc>().add(UpdateSettings(settings));
                Navigator.pop(context);
              },
              child: Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
