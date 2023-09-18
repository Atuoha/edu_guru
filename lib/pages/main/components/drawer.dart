import 'package:flutter/material.dart';

Drawer buildDrawer() => Drawer(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Menu'),
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => Scaffold.of(context).closeDrawer(),
                      child: const Icon(Icons.close),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
