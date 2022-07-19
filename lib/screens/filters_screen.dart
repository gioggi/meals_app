import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.filters['gluten'] as  bool;
    _vegetarian = widget.filters['vegetarian']as  bool;
    _vegan = widget.filters['vegan']as  bool;
    _lactoseFree = widget.filters['lactose']as  bool;
    super.initState();
  }

  Widget _buildSwitchListItem(String title, String description, bool currentValue, Function(bool?) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }, icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust you meal preferences',
            style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListItem('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newValue) {
                setState(
                    () {
                      _glutenFree = newValue!;
                    }
                );
              }),
              _buildSwitchListItem('Vegetarian', 'Only include vegetarian meals', _vegetarian, (newValue) {
                setState(
                        () {
                        _vegetarian = newValue!;
                    }
                );
              }),
              _buildSwitchListItem('Vegan', 'Only include vegan meals', _vegan, (newValue) {
                setState(
                        () {
                          _vegan = newValue!;
                    }
                );
              }),
              _buildSwitchListItem('Lactose-free', 'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(
                        () {
                          _lactoseFree = newValue!;
                    }
                );
              })
            ],
          ))
        ],
      ),
    );
  }
}