import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/city.dart';
import '../models/settings.dart';
import '../models/travel_plan.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<TravelPlan> fetchTravelPlan(City city, TravelSettings settings) async {
    final response = await http.post(
      Uri.parse('$baseUrl/generate-trip'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'location': city.name,
        'dateStart': settings.toJson()['dateStart'],
        'dateEnd': settings.toJson()['dateEnd'],
        'tripType': settings.travelType,
        'budgetType': settings.budgetType,
        'tripPace': settings.travelStyle,
        'interest': settings.interest,
      }),
    );

    if (response.statusCode == 200) {
      return TravelPlan.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load travel plan');
    }
  }
}
