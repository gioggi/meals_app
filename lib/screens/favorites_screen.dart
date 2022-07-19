import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  FavoritesScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoritesMeal[index].id,
              title: favoritesMeal[index].title,
              imageUrl: favoritesMeal[index].imageUrl,
              affordability: favoritesMeal[index].affordability,
              complexity: favoritesMeal[index].complexity,
              duration: favoritesMeal[index].duration);
        },
        itemCount: favoritesMeal.length,
      ) ,
    );
  }
}