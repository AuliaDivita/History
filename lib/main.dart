import 'package:flutter/material.dart';
import 'package:flutter_pemmob/page/griddashboard.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: OnboardingScreen(), // Ganti dengan OnboardingScreen sebagai tampilan awal
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
      pageColor:  Color(0xff392850),
      body: Text(
        'Selamat datang di aplikasi kami',
      ),
      mainImage: Image.asset(
        'assets/History.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      title: Text(
        'Selamat Datang',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
    PageViewModel(
      pageColor:  Color(0xff392850),
      body: Text(
        'Ceritakan sejarahmu dengan mudah',
      ),
      mainImage: Image.asset(
        'assets/vektor_write.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      title: Text(
        'Ceritakan Sejarah',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
    PageViewModel(
      pageColor:  Color(0xff392850),
      body: Text(
        'Temukan dan bagikan sejarah bersama kami',
      ),
      mainImage: Image.asset(
        'assets/vektor_read.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      title: Text(
        'Temukan dan Bagikan',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            // Navigasi ke halaman utama (GridDashboard)
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => GridDashboard(), // Ganti dengan tampilan utama yang diinginkan
            ));
          },
          showNextButton: true,
          showBackButton: true,
          showSkipButton: true,
          doneText: Text("Selesai"),
          nextText: Text("Selanjutnya"),
          backText: Text("Kembali"),
          skipText: Text("Lewati"),
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
