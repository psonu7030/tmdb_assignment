import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'features/data/repositories/api/movie_api.dart';
import 'features/presentation/bloc/movie_block.dart';
import 'features/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home:  BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(movieApiService: MovieApi()),
    child:  HomePage(),
    ));
  }
}