import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: menus.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar App'),
            bottom: TabBar(
              isScrollable: true,
              tabs: menus.map((Menu menu) {
                return Tab(text: menu.title, icon: Icon(menu.icon));
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: menus.map((Menu menu) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: MenuPage(
                  menu: menu,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Menu {
  final String title;
  final IconData icon;
  const Menu({this.title, this.icon});
}

const List<Menu> menus = <Menu>[
  Menu(title: 'Home', icon: Icons.home),
  Menu(title: 'History', icon: Icons.history),
  Menu(title: 'Notify', icon: Icons.notifications),
  Menu(title: 'Note', icon: Icons.note),
  Menu(title: 'Settings', icon: Icons.settings)
];

class MenuPage extends StatelessWidget {
  const MenuPage({Key key, this.menu}) : super(key: key);
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              menu.icon,
              size: 140,
              color: textStyle.color,
            ),
            Text(
              menu.title,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
