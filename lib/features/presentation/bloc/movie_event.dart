abstract class MovieEvent{}
 class GetMovies extends MovieEvent{
 String type;
 GetMovies({required this.type});
 }

class GetMovieDetails extends MovieEvent{
 String id;
 GetMovieDetails({required this.id});
}

// class GetYtLink extends MovieEvent{
//  String id;
//  GetYtLink({required this.id});
// }
class GetMovieOtherDetail extends MovieEvent{
 String id;
 String otherDetail;
 GetMovieOtherDetail({required this.id, required this.otherDetail});
}
// class GetCrew extends MovieEvent{
//  String id;
//  GetCrew({required this.id});
// }
// class GetRecommendations extends MovieEvent{
//  String id;
//  GetRecommendations({required this.id});
// }