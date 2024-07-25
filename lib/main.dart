import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bug Bomb',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Is Too Buggy!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final item = MenuItemButton(
      onPressed: () {},
      leadingIcon: const Icon(Icons.snooze),
      // child can't be null, interface is bad
      child: const Text('Menu Bugs'),
    );

    final sub = SubmenuButton(
      menuChildren: [
        item,
        item,
        item,
        item,
      ],
      leadingIcon: const Icon(Icons.snooze),
      // child can't be null, interface is bad
      child: const Text('Submenu Bugs'),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click the menu and it pops down, as you move the mouse down, the sub menus appear and disappear as normal.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'But click a second time and move the mouse down and now the submenus stay put and they dont disappear as they should.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            MenuBar(
              children: [
                SubmenuButton(
                  menuChildren: [
                    sub,
                    item,
                    sub,
                    item,
                    item,
                    sub,
                  ],
                  child: const Icon(Icons.menu),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              'Please Un-ban my account from Flutter Github: sgehrman@gmail.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Bug Confirmed on Linux and Web, but probably happens on all platforms',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Still need a hotfix for the Web downloading files hang. 3.22.x has been a disaster',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
