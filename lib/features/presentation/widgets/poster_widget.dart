import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../data/repositories/api/movie_api.dart';
import '../pages/poster_detail_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/movie_model.dart';
import '../bloc/movie_block.dart';
import '../bloc/movie_event.dart';



class PosterWidget extends StatefulWidget {
  final int? id;
  final double? score;
  final String? date;
  final String? posterUrl;
  final String? title;
  const PosterWidget({super.key, required this.id, required this.score, required this.date, required this.posterUrl, required this.title});

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Stack(
              alignment:Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 19),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => MovieBloc(movieApiService: MovieApi()),
                            child: PosterDetailScreen(id:widget.id.toString()),
                          ),
                        ),
                      );
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PosterDetailScreen()));
                    },
                    child: Card(
                      child: Container(
                        height: 230,
                        width: 150,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                                image: NetworkImage(
                                    Constants.imageBaseUrl+ widget.posterUrl.toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                  Padding(
                  padding:  EdgeInsets.only(left: 17),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0XFF081C22),
                    child:
                    CircularProgressIndicator(
                      value: widget.score!/10,
                      color: Color(0XFF21D07A),
                      backgroundColor: Color(0XFF204528),
                      strokeWidth: 3.0,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 29,bottom: 13),
                  child: RichText(
                    text: TextSpan(
                        children: [
                            TextSpan(text: (widget.score!*10).toStringAsFixed(0),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(2, -4),
                                child:
                                const   Text("%",textScaler:TextScaler.linear(0.7),
                                  style: TextStyle(color: Colors.white,fontSize: 12),)
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
               Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(widget.title.toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,overflow: TextOverflow.ellipsis)),
            ),
               Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(widget.date.toString(),style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w400,fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }
}
