import 'package:filmin/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({super.key, required this.movies, this.title});

  final List<Movie> movies;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                title!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  print('aasdsa $movies');
                  //final Movie moviePopular = movies[index];
                  return _MoviePoster(moviePopular: movies[index]);
                }),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key, required this.moviePopular});
  final Movie moviePopular;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      //color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(moviePopular.fullPosterImg),
                width: 130,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            moviePopular.title,
            overflow: TextOverflow.ellipsis,
            //maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
