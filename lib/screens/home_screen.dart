import 'package:flutter/material.dart';
import 'package:filmin/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmin'),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: const [
          // Card Swiper
          CardSwiper()
          // Listado horizontal de peliculas
        ],
      ),
    );
  }
}
