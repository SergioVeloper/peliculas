import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Peliculas en Cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                showSearch(context: context, delegate: MovieSearchDelegate());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Todo: CardSwiper
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              //Todo: Listado Horizontal de peliculas
              MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies()),
            ],
          ),
        )
      );
  }
}
