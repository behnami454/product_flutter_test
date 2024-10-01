import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/blocs/product/product_bloc.dart';

void showFilterOptions(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[850],
        title: const Text(
          'Filter Products',
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterButton(
                context,
                'Price: Low to High',
                () {
                  Navigator.of(context).pop();
                  context.read<ProductBloc>().add(const SortProductsByPrice(true));
                },
              ),
              _buildFilterButton(
                context,
                'Price: High to Low',
                () {
                  Navigator.of(context).pop();
                  context.read<ProductBloc>().add(const SortProductsByPrice(false));
                },
              ),
              _buildFilterButton(
                context,
                'Sort by Rating',
                () {
                  Navigator.of(context).pop();
                  context.read<ProductBloc>().add(const SortProductsByRating(true));
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildFilterButton(BuildContext context, String text, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[700],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}
