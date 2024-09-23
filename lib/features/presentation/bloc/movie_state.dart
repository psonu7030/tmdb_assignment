import '../../data/models/crew_detail_model.dart';
import '../../data/models/movie_detail_model.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/recommendation_model.dart';
import '../../data/models/yt_detail_model.dart';

abstract class MovieState{}

class Initial extends MovieState{}
class Loading extends MovieState{}
class Error extends MovieState{
  String error;
  Error({required this.error});
}
class PopularMovieLoaded extends MovieState{
  MovieModel? movieModel;
  PopularMovieLoaded({this.movieModel});

}
class TopRatedMovieLoaded extends MovieState{
  MovieModel? movieModel;
  TopRatedMovieLoaded({this.movieModel});

}
class UpComingMovieLoaded extends MovieState{
  MovieModel? movieModel;
  UpComingMovieLoaded({this.movieModel});
}

class MovieDetailLoaded extends MovieState{
  MovieDetailModel? movieDetailModel;
  MovieDetailLoaded({this.movieDetailModel});
}

class YtDetailLoaded extends MovieState{
  MovieYtDetailModel? movieYtDetailModel;
  YtDetailLoaded({this.movieYtDetailModel});
}

class  CrewDetailLoaded extends MovieState{
  CrewDetailModel? crewDetailModel;
  CrewDetailLoaded({this.crewDetailModel});
}
class  RecommendationsLoaded extends MovieState{
  RecommendationModel? recommendationModel;
  RecommendationsLoaded({this.recommendationModel});
}