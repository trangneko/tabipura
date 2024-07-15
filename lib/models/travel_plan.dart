import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelPlan {
  String title;
  String tripType;
  String budgetType;
  String tripPace;
  String interest;
  List<DayPlan> days;
  String tips;

  TravelPlan({
    required this.title,
    required this.tripType,
    required this.budgetType,
    required this.tripPace,
    required this.interest,
    required this.days,
    required this.tips,
  });

  factory TravelPlan.fromRawJson(String str) =>
      TravelPlan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelPlan.fromJson(Map<String, dynamic> json) => TravelPlan(
        title: json["title"],
        tripType: json["trip_type"],
        budgetType: json["budget_type"],
        tripPace: json["trip_pace"],
        interest: json["interest"],
        days: List<DayPlan>.from(json["days"].map((x) => DayPlan.fromJson(x))),
        tips: json["tips"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "trip_type": tripType,
        "budget_type": budgetType,
        "trip_pace": tripPace,
        "interest": interest,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "tips": tips,
      };
}

class DayPlan {
  final int day;
  final String date;
  final List<Activity> activities;

  DayPlan({
    required this.day,
    required this.date,
    required this.activities,
  });

  factory DayPlan.fromJson(Map<String, dynamic> json) {
    return DayPlan(
      day: json['day'],
      date: json['date'],
      activities: (json['activities'] as List)
          .map((i) => Activity.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'date': date,
      'activities': activities.map((i) => i.toJson()).toList(),
    };
  }
}

class Activity {
  final String place;
  final LatLng? coordinates;
  final String address;
  final String imageUrl;
  final String description;

  Activity({
    required this.place,
    this.coordinates,
    required this.address,
    required this.imageUrl,
    required this.description,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      place: json['place'],
      coordinates: json['coordinates'] != null
          ? LatLng(json['coordinates']['lat'], json['coordinates']['lng'])
          : null,
      address: json['address'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place': place,
      if (coordinates != null)
        'coordinates': {
          'lat': coordinates!.latitude,
          'lng': coordinates!.longitude,
        },
      'address': address,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}