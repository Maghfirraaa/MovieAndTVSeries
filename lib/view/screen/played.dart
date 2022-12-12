import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import '../../model/movie.dart';
import '../../viewmodel/movie.dart';
import '../movielist.dart';

class FilmLama extends StatelessWidget {
  const FilmLama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The film has been shown"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: FutureBuilder<List<Movie>>(
            future: fetchMovie(http.Client(), 'now_playing'),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? MovieList(movie: snapshot.data!)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
