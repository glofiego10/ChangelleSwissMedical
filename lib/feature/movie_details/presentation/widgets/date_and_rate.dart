import 'package:challenge_swiss/core/helpers/date_time_formatter.dart';
import 'package:flutter/material.dart';

class DateAndRateMovie extends StatelessWidget {
  const DateAndRateMovie({
    required this.date,
    required this.rating,
    super.key,
  });

  final String date;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 4),
        Text(
          '${formatDate(date)} ',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              rating.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
