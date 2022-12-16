import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/view/HomePage.dart';
import 'package:mobileapp/view/onboarding.dart';
import 'package:mobileapp/view/screen/played.dart';
import 'package:mobileapp/view/screen/play.dart';
import 'package:mobileapp/view/tvlist.dart';
import '../SharedPref.dart';

class landingPage extends StatefulWidget {
  // late String param;
  // landingPage({Key? key, required this.param}) : super(key: key);
  Function setTheme;
  final movie;
  landingPage({Key? key, required this.setTheme, required this.movie})
      : super(key: key);
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  // final String ;
  // _landingPageState({required this.param});
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
  ThemeData themeData = ThemeData.light();
  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkmode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
      /* simpan nilai boolean pada shared preferences */
      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
      print(isDarkmode);
    });
  }

  int _bottomNavCurrentIndex = 0;

  @override
  void initState() {
    // print(param.toString());
    // super.initState();
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: const Text(
          "Movie And TV Series",
          style: TextStyle(color: Colors.white),
        ),
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded,
                color: const Color.fromARGB(255, 253, 251, 251)),
            padding: EdgeInsets.only(right: 25),
            onPressed: () {
              isDarkmode = !isDarkmode;
              widget.setTheme(isDarkmode);
            },
          )
        ],
      ),
      body: homePage(setTheme: setTheme),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Movie and TV Series',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            ListTile(
                leading: Icon(Icons.movie),
                title: const Text('Latest Movies'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Play()))),
            ListTile(
                leading: Icon(Icons.movie_outlined),
                title: const Text('Past Movies'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FilmLama()))),
            new Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: new Icon(Icons.cancel),
              title: const Text('LOGOUT'),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const onboarding()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
