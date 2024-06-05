import 'package:flutter/material.dart';
import 'package:flutter_pemmob/page/sejarah_pahlawan_page.dart';
import 'package:flutter_pemmob/page/sejarah_indonesia.dart';
import 'package:flutter_pemmob/page/create_story.dart';
import 'package:flutter_pemmob/page/aktivitas_page.dart';

class Items {
  String title;
  String subtitle;
  String event;
  String img;

  Items({
    required this.title,
    required this.subtitle,
    required this.event,
    required this.img,
  });
}

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "Sejarah Pahlawan",
    subtitle: "List Pahlawan",
    img: "assets/person.png",
    event: '/sejarah_pahlawan',
  );

  Items item2 = Items(
    title: "Sejarah Indonesia",
    subtitle: "Sejarah Indonesia",
    img: "assets/globe.png",
    event: '/sejarah_indonesia',
  );

  Items item3 = Items(
    title: "Create Story",
    subtitle: "Tambahkan Cerita",
    img: "assets/Pensil.png",
    event: '/tambah_cerita',
  );

  Items item4 = Items(
    title: "Aktivitas",
    subtitle: "Aktivitas Anda",
    img: "assets/aktivitas.png",
    event: '/aktivitas_anda',
  );

  GridDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Color(0xff392850),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xff392850),
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: myList.map((data) {
                return GestureDetector(
                  onTap: () {
                    if (data.event == '/sejarah_pahlawan') {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SejarahPahlawan(),
                      ));
                    } else if (data.event == '/sejarah_indonesia') {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SejarahIndonesia(),
                      ));
                    } else if (data.event == '/tambah_cerita') {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateStoryPage(),
                      ));
                    } else if (data.event == '/aktivitas_anda') {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AktivitasPage(aktivitasItems: []),
                      ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          data.title,
                          style: TextStyle(
                            color: Color(0xff392850),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          data.subtitle,
                          style: TextStyle(
                            color: Color(0xff392850),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 14,),
                        Text(
                          data.event,
                          style: TextStyle(
                            color: Color(0xff392850),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
