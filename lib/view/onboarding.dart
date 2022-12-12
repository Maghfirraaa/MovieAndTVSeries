import 'package:flutter/material.dart';
import 'package:mobileapp/view/landing.dart';
import 'package:mobileapp/view/login.dart';
import '../SharedPref.dart';

Future<void> main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  // runApp(const onboarding());
}

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  ThemeData themeData = ThemeData.light();
  //mengubah fungsi sesuai parameter
  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();

      //simpan nilai bolean pada shared preferences
      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
      print(isDarkmode);
    });
  }

  @override
  void initState() {
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'images/movie.png',
                width: 300,
                height: 350,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Use your spare time to watch your favorite movies",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Get showtime information about your favorite movies in theaters and TV series",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(setTheme: setTheme)));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.blue[400],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(120, 16, 120, 16),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
