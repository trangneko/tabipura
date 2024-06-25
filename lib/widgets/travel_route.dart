import 'package:flutter/material.dart';

class TravelRoute extends StatelessWidget {
  final List<String> route;

  const TravelRoute({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: route.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(route[index]),
        );
      },
    );
  }
}
