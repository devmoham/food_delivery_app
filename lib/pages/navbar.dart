import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepOrange[400]),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      themeNotifier.isDarkMode ? Colors.black45 : Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/mohamed.jpg',
                    ),
                  ),
                ),
                accountName: Text(
                  'Mohamed Mostafa',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  'mohamed.mostafa432100@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
              ),
            )
          ]),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.local_offer_sharp),
            title: Text('Offers'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Acoount'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settinge'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () => null,
          ),
          SwitchListTile(
            activeColor: Colors.deepOrange,
            title: const Text('Dark Mode'),
            value: themeNotifier.isDarkMode,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
