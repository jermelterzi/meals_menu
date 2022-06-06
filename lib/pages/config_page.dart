import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key, required this.onSettingsChanged, required this.settings}) : super(key: key);

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  _createSwitch(
    String title,
    String subtitle,
    Function(bool) onChanged,
    bool value,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  (value) => setState(() => settings.isGlutenFree = value),
                  settings.isGlutenFree,
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  (value) => setState(() => settings.isLactoseFree = value),
                  settings.isLactoseFree,
                ),
                _createSwitch(
                  'Vagana',
                  'Só exibe refeições veganas',
                  (value) => setState(() => settings.isVegan = value),
                  settings.isVegan,
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  (value) => setState(() => settings.isVegetarian = value),
                  settings.isVegetarian,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
