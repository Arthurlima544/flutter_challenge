import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    required this.number,
    required this.title,
    required this.description,
    super.key,
  });
  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          radius: 14,
          child: Text(
            number,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(description),
            ],
          ),
        ),
      ],
    ),
  );
}
