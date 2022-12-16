import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/movie.dart';
import 'package:mobileapp/view/tvlist.dart';
import '../viewmodel/tv.dart';
import 'detailscreen.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  // late String param;
  // landingPage({Key? key, required this.param}) : super(key: key);
  Function setTheme;
  homePage({Key? key, required this.setTheme}) : super(key: key);
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  void setTheme() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  Widget card() {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 144,
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Movie and TV Series",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "solution to fill your vacation time",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          card(),
          SizedBox(
            height: 24,
          ),
          Text(
            "Top Favorite TV Series",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: FutureBuilder<List<Movie>>(
            future: fetchTv(http.Client(), 'popular'),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? Tvlist(movie: snapshot.data!)
                  : Center(child: CircularProgressIndicator());
            },
          )),
        ],
      ),
    ));
  }
}
