import 'package:flutter/material.dart';

class AktivitasPage extends StatefulWidget {
  final List<String> aktivitasItems;

  AktivitasPage({required this.aktivitasItems});

  @override
  _AktivitasPageState createState() => _AktivitasPageState();
}

class _AktivitasPageState extends State<AktivitasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas'),
        backgroundColor: Color(0xff392850), // Warna latar belakang header
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Anda telah menambahkan cerita Dekrit Presiden',
                style: TextStyle(
                  fontSize: 24.0,
                  // fontWeight: FontWeight.bold, // Menghilangkan penggunaan bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
