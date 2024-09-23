import 'package:clean_architecture/core/utils/globals.dart';
import 'package:clean_architecture/features/presentation/widgets/poster_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';
import '../../data/models/movie_model.dart';
import '../bloc/movie_block.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModel? popularMovie;
  MovieModel? topRated;
  MovieModel? upcoming;

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  getMovieList() {
    BlocProvider.of<MovieBloc>(context).add(GetMovies(type: "popular"));
    BlocProvider.of<MovieBloc>(context).add(GetMovies(type: "top_rated"));
    BlocProvider.of<MovieBloc>(context).add(GetMovies(type: "upcoming"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color(0XFF032541),
          title: const Center(
              child: Text(
            "TMDB",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),
          )),
        ),
        body: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is Loading) {
              return Utils.loader();
            }

            if (state is PopularMovieLoaded) {
              popularMovie = state.movieModel;
              print("popularMovie : $popularMovie");
            }
            if (state is TopRatedMovieLoaded) {
              topRated = state.movieModel;
              print("topRated: $topRated");
            }
            if (state is UpComingMovieLoaded) {
              upcoming = state.movieModel;
              print("upcoming : $upcoming");
            }
            if(state is Error){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          builder: (context, state) {
            if (state is Initial ||state is Loading) {
              return Utils.loader();
            }
            return bodyWidget();
          },
        ));
  }

  bodyWidget() {
    return SingleChildScrollView(
      child:
      popularMovie!=null && popularMovie!.results.isNotEmpty?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular-Movies",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 340,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularMovie?.results.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return PosterWidget(
                          id: popularMovie?.results[index].id,
                          score: popularMovie?.results[index].voteAverage,
                          date: popularMovie?.results[index].releaseDate,
                          posterUrl: popularMovie?.results[index].posterPath,
                          title: popularMovie?.results[index].title);
                    }),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                "Top Rated Movies",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRated?.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return PosterWidget(
                        id: topRated?.results[index].id,
                        score: topRated?.results[index].voteAverage,
                        date: topRated?.results[index].releaseDate,
                        posterUrl: topRated?.results[index].posterPath,
                        title: topRated?.results[index].title);
                  }),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                "Upcoming Movies",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming?.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return PosterWidget(
                        id: upcoming?.results[index].id,
                        score: upcoming?.results[index].voteAverage,
                        date: upcoming?.results[index].releaseDate,
                        posterUrl: upcoming?.results[index].posterPath,
                        title: upcoming?.results[index].title);
                  }),
            ),
          ],
        ),
      ):Center(child: Text("No Data"),),
    );
  }
}
