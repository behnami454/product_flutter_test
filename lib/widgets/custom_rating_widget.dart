import 'package:flutter/material.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;

  const CustomRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: Colors.yellow[700],
        );
      }),
    );
  }
}
