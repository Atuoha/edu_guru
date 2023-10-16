import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
        title: const Text('Wish List'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
