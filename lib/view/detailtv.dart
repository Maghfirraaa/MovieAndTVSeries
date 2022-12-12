import 'package:flutter/material.dart';
import '../model/movie.dart';

class DetailTv extends StatelessWidget {
  final Movie movie;

  DetailTv({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      movie.name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    movie.language,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'release : ' + movie.first_air_date,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    Widget bagiagDeskripsi = Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 80,
      ),
      child: Text(
        movie.overview,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.name,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original' + movie.picture,
            width: 80,
            height: 550,
            fit: BoxFit.cover,
          ),
          bagianJudul,
          bagiagDeskripsi,
        ],
      ),
    );
  }
}
