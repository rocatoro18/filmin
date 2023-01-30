import 'package:filmin/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  MovieSlider(
      {super.key, required this.movies, this.title, required this.onNextPage});

  final List<Movie> movies;
  String? title;
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
        //print('LLAMA A LA PETICIÓN HTTP');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, index) {
                  //print('aasdsa ${widget.movies}');
                  //final Movie moviePopular = movies[index];
                  return _MoviePoster(
                      moviePopular: widget.movies[index],
                      heroId:
                          '${widget.title}- $index -${widget.movies[index].id}');
                }),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster(
      {super.key, required this.moviePopular, required this.heroId});
  final Movie moviePopular;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    moviePopular.heroId = heroId;
    return Container(
      width: 130,
      height: 200,
      //color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: moviePopular);
            },
            child: Hero(
              tag: moviePopular.heroId!,
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
