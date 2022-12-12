import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../model/movie.dart';
import '../../viewmodel/movie.dart';
import '../movielist.dart';
import 'package:http/http.dart' as http;

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Current and Upcoming movies"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: FutureBuilder<List<Movie>>(
            future: fetchMovie(http.Client(), 'upcoming'),
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
