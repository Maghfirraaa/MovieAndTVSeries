import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import '../../model/movie.dart';
import '../../viewmodel/tv.dart';
import '../tvlist.dart';

class tvScreen extends StatelessWidget {
  const tvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog TV Series"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: FutureBuilder<List<Movie>>(
        future: fetchTv(http.Client(), 'popular'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Tvlist(movie: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
