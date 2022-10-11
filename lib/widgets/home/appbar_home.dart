import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget with PreferredSizeWidget {
  const BuildAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 225, 31),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 15.0)
        ],
      );
}
