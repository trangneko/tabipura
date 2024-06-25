import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/city_bloc.dart';
import '../models/city.dart';

class CityInputField extends StatelessWidget {
  final List<City> suggestedCities;

  const CityInputField({super.key, required this.suggestedCities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter city',
          ),
          onChanged: (value) {
            // Optionally handle input changes
          },
          onSubmitted: (value) {
            context.read<CityBloc>().add(SelectCity(City(value)));
          },
        ),
        Wrap(
          children: suggestedCities.map((city) {
            return GestureDetector(
              onTap: () {
                context.read<CityBloc>().add(SelectCity(city));
              },
              child: Chip(label: Text(city.name)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
