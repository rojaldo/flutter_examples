import 'package:flutter/material.dart';

class HeroesWidget extends StatefulWidget {
  const HeroesWidget({Key? key}) : super(key: key);

  @override
  _HeroesWidgetState createState() => _HeroesWidgetState();
}

class _HeroesWidgetState extends State<HeroesWidget> {
  List<String> heroes = ['Batman', 'Superman', 'Spiderman'];
  late TextEditingController _heroController;
  ListView _heroesList = ListView();

  @override
  void initState() {
    super.initState();
    _heroController = TextEditingController();
    _heroesList = _getHeroesList();
  }

  _onNameChanged(String value) {}

  ListView _getHeroesList() {
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(heroes[index]),
        );
      },
    );
  }

  _addHero() {
    setState(() {
      heroes.add(_heroController.text);
      _heroesList = _getHeroesList();
      _heroController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _heroController,
            onChanged: _onNameChanged,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'new Hero',
            ),
          ),
          ElevatedButton(onPressed: _addHero, child: const Text('Add Hero')),
          Expanded(child: _heroesList),
        ],
      ),
    );
  }
}
