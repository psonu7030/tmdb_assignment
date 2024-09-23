

import 'dart:developer';

import 'package:clean_architecture/core/constants/constants.dart';
 import 'package:http/http.dart' as http;
abstract class MovieApiService{
  getMovie({required String type});
  getMovieDetail({required String id});
  getMovieOtherDetail({required String id, required String otherDetail});
  // getCrew({required String id});
  // getRecommendations({required String id});
 }

 class MovieApi implements MovieApiService{
  http.Response? response;
  final String baseUrl=Constants.baseUrl;
  final String apiKey=Constants.apiKey;

  @override
  getMovie({required String type})async{
  response = await http.get(Uri.parse(baseUrl+type+apiKey));
  log(response!.body);
  return response;
  }

  @override
  getMovieDetail({required String id})async {
   response = await http.get(Uri.parse(baseUrl+id+apiKey));
   log(response!.body);
   return response;
  }
  @override
  getMovieOtherDetail({required String id,required String otherDetail})async{
   response = await http.get(Uri.parse(baseUrl+id+"/$otherDetail"+apiKey));
   log(response!.body);
   return response;
 }

  // @override
  // getCrew({required String id})async{
  //  response = await http.get(Uri.parse(baseUrl+id+"credits"+apiKey));
  //  log(response!.body);
  //  return response;
  // }
  // @override
  // getRecommendations({required String id})async{
  //  response = await http.get(Uri.parse(baseUrl+id+"credits"+apiKey));
  //  log(response!.body);
  //  return response;
  // }
 }