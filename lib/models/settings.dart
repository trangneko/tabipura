class TravelSettings {
  final DateTime dateStart;
  final DateTime dateEnd;
  final String travelType;
  final String budgetType;
  final String travelStyle;
  final String interest;

  TravelSettings({
    required this.travelType,
    required this.dateStart,
    required this.dateEnd,
    required this.budgetType,
    required this.travelStyle, required this.interest, 
  });

  Map<String, dynamic> toJson() {
    return {
      'dateStart': _formatDate(dateStart),
      'dateEnd': _formatDate(dateEnd),
      'tripType': travelType,
      'budgetType': budgetType,
      'tripPace': travelStyle,
      'interest': interest,
    };
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
