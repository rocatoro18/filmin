import 'package:filmin/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:filmin/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvier = Provider.of<MoviesProvider>(context);

    //print(moviesProvier.onDisplayMovies);
    //print('POPULARES ${moviesProvier.popularMovies}');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Filmin'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas Principales
              CardSwiper(movies: moviesProvier.onDisplayMovies),
              // Slider de Peliculas
              MovieSlider(
                movies: moviesProvier.popularMovies,
                title: 'Populares',
                onNextPage: () {
                  moviesProvier.getPopularMovies();
                },
              ),
            ],
          ),
        ));
  }
}
