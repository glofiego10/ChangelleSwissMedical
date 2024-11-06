import 'package:flutter/material.dart';

class GenderMovie extends StatelessWidget {
  const GenderMovie({required this.genres, super.key});
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          for (int i = 0; i < genres.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                genres[i] + (i < genres.length - 1 ? ' |' : ''),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
