import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class MealFullScreenItem extends StatelessWidget {
  const MealFullScreenItem({super.key, required this.meal});

  final Category meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
    );
  }
}
