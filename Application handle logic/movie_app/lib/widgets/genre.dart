import 'package:flutter/cupertino.dart';
import 'package:movie_app/bloc/get_genres_bloc.dart';
import 'package:movie_app/model/Genre_response.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/widgets/genres_list.dart';

import 'constant.dart';

class GenreScreen extends StatefulWidget{

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genresBloc.. getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
        stream: genresBloc.subject.stream,
        builder: (context,AsyncSnapshot<GenreResponse> snapshot){
          if(snapshot.hasData){
            if(snapshot.data.error != null && snapshot.data.error.length > 0){
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildGenreWidget(snapshot.data);
          }else if(snapshot.hasError){
            return buildErrorWidget(snapshot.error);
          }else{
            return buildLoadingWidget();
          }
        });
  }

  Widget _buildGenreWidget(GenreResponse data) {
   List<Genre> genres = data.genres;

   if(genres.length ==0){
     return Container(child: Center(child: Text('No Genre'),),);
   }else return GenresList(genres: genres,);

  }
}