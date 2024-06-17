// Class representing the entire trip plan
class TripPlan {
  final TripDetails tripDetails;
  final List<Itinerary> itinerary;
  final List<Suggestion> suggestions;
  final List<String> tips;

  TripPlan({
    required this.tripDetails,
    required this.itinerary,
    required this.suggestions,
    required this.tips,
  });

  factory TripPlan.fromJson(Map<String, dynamic> json) {
    return TripPlan(
      tripDetails: TripDetails.fromJson(json['trip_details']),
      itinerary: (json['itinerary'] as List)
          .map((item) => Itinerary.fromJson(item))
          .toList(),
      suggestions: (json['suggestions'] as List)
          .map((item) => Suggestion.fromJson(item))
          .toList(),
      tips: List<String>.from(json['tips']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trip_details': tripDetails.toJson(),
      'itinerary': itinerary.map((item) => item.toJson()).toList(),
      'suggestions': suggestions.map((item) => item.toJson()).toList(),
      'tips': tips,
    };
  }
}

// Class representing trip details
class TripDetails {
  final String destination;
  final TravelDates travelDates;
  final int travelers;
  final String budget;
  final List<String> interests;
  final String tripType;
  final String transportation;

  TripDetails({
    required this.destination,
    required this.travelDates,
    required this.travelers,
    required this.budget,
    required this.interests,
    required this.tripType,
    this.transportation = "Public Transport",
  });

  factory TripDetails.fromJson(Map<String, dynamic> json) {
    return TripDetails(
      destination: json['destination'],
      travelDates: TravelDates.fromJson(json['travel_dates']),
      travelers: json['travelers'],
      budget: json['budget'],
      interests: List<String>.from(json['interests']),
      tripType: json['trip_type'],
      transportation: json['transportation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'destination': destination,
      'travel_dates': travelDates.toJson(),
      'travelers': travelers,
      'budget': budget,
      'interests': interests,
      'trip_type': tripType,
      'transportation': transportation,
    };
  }
}

// Class representing travel dates
class TravelDates {
  final String startDate;
  final String endDate;

  TravelDates({
    required this.startDate,
    required this.endDate,
  });

  factory TravelDates.fromJson(Map<String, dynamic> json) {
    return TravelDates(
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}

// Class representing itinerary
class Itinerary {
  final int day;
  final String title;
  final String description;
  final List<Location> locations;
  final Transport transport;
  final String notes;

  Itinerary({
    required this.day,
    required this.title,
    required this.description,
    required this.locations,
    required this.transport,
    required this.notes,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    return Itinerary(
      day: json['day'],
      title: json['title'],
      description: json['description'],
      locations: (json['locations'] as List)
          .map((item) => Location.fromJson(item))
          .toList(),
      transport: Transport.fromJson(json['transport']),
      notes: json['notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'title': title,
      'description': description,
      'locations': locations.map((item) => item.toJson()).toList(),
      'transport': transport.toJson(),
      'notes': notes,
    };
  }
}

// Class representing location
class Location {
  final String name;
  final String type;
  final String address;
  final List<double> coordinates;
  final String openingHours;
  final String website;
  final String image;

  Location({
    required this.name,
    required this.type,
    required this.address,
    required this.coordinates,
    required this.openingHours,
    required this.website,
    required this.image,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      type: json['type'],
      address: json['address'],
      coordinates: List<double>.from(json['coordinates']),
      openingHours: json['opening_hours'],
      website: json['website'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'address': address,
      'coordinates': coordinates,
      'opening_hours': openingHours,
      'website': website,
      'image': image,
    };
  }
}

// Class representing transport
class Transport {
  final String mode;
  final String duration;

  Transport({
    required this.mode,
    required this.duration,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      mode: json['mode'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
      'duration': duration,
    };
  }
}

// Class representing suggestion
class Suggestion {
  final String type;
  final String name;
  final String description;
  final String image;

  Suggestion({
    required this.type,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
