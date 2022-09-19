import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/controller/theme.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: const [],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Weather'),
      actions: [
        Consumer<ChangeTheme>(builder: (context, toggleController, _) {
          return IconButton(
              onPressed: () {
                toggleController.toggleTheme();
              },
              icon: !toggleController.getDark
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode));
        }),
      ],
    );
  }

  @override
  Widget get child => const SizedBox();
  @override
  Size get preferredSize => const Size.fromHeight(40);
}
