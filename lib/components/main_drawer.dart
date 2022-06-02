import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 16,
              right: 16,
              left: 16,
            ),
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontSize: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.CONFIG_PAGE),
          ),
        ],
      ),
    );
  }
}
