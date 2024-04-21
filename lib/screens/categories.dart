import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widget/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onTaggleFovorite,
      required this.availableMeals});

  final void Function(Meal meal) onTaggleFovorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredList = availableMeals
        .where(
          (element) => element.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => MealsScreen(
              title: category.title,
              allMeals: filteredList,
              onTaggleFovorite: onTaggleFovorite,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      children: [
        ...availableCategories
            .map((e) => CategoryGridItem(
                  category: e,
                  onSelectedCategory: () {
                    _selectCategory(context, e);
                  },
                ))
            .toList()
        // for (final category in availableCategories)
        //   CategoryGridItem(category: category)
      ],
    );
  }
}
