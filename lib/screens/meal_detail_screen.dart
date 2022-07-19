import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function isMealFavorite;
  final Function toggleFavorite;
  MealDetailScreen(this.isMealFavorite, this.toggleFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //
    // final String categoryTitle = routesArg['title'].toString();
    final String mealId = routesArg['id'].toString();
    final meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
        appBar: AppBar(title: Text(meal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index])),
                ),
                itemCount: meal.ingredients.length,
              )),
              buildSectionTitle(context, 'Steps '),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                  ]),
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
              isMealFavorite(mealId) ? Icons.star : Icons.star_border
          ),
          onPressed: () => toggleFavorite(mealId),
        )
      );
  }
}
