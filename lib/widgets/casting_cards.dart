import 'package:filmin/models/models.dart';
import 'package:filmin/providers/movies_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator(),
            );
          }
          final cast = snapshot.data!;
          return Container(
            margin: const EdgeInsets.only(bottom: 50),
            width: double.infinity,
            height: 180,
            //color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: ((_, index) {
                return _CastCard(cast: cast[index]);
              }),
            ),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key, required this.cast});
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                height: 130,
                width: 100,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(cast.fullProfileImg)),
          ),
          const SizedBox(height: 5),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
