import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter/material.dart';
import '../modelsi_main.dart';
import 'detailcerita_page.dart';
import '../page/griddashboard.dart';

void main() {
  runApp(const SejarahIndonesia());
}

class SejarahIndonesia extends StatelessWidget {
  const SejarahIndonesia({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SejarahIndonesiaPage(),
    );
  }
}

class SejarahIndonesiaPage extends StatefulWidget {
  const SejarahIndonesiaPage({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _SejarahIndonesiaState();
  }
}

class _SejarahIndonesiaState extends State<SejarahIndonesiaPage> {
  Future<List<ModelSiMain>> readJsonData() async {
    final jsonData = await root_bundle.rootBundle
        .loadString('assets/sejarah_nasional.json');
    final listData = json.decode(jsonData) as List<dynamic>;
    return listData.map((e) => ModelSiMain.fromJson(e)).toList();
  }

  TextEditingController searchController = TextEditingController();
  String? filterData;
  ScrollController scrollController = ScrollController();
  bool showFab = false;

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filterData = searchController.text;
      });
    });

    scrollController.addListener(() {
      if (scrollController.offset > 10) {
        showFab = true;
        setState(() {});
      } else {
        showFab = false;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke tampilan GridDashboard
            Navigator.of(context).pop();
          },
        ),
        title: const Center(
          child: Text('History',
              style: TextStyle(
                  color: Color(0xff392850),
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: showFab ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            // Kembali ke tampilan GridDashboard
            Navigator.of(context).pop();
          },
          backgroundColor: Color(0xff392850),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Cari Cerita',
                  suffixIcon: searchController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: searchController.clear,
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color(0xff392850), width: 2),
                  )),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: readJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ModelSiMain>;
                  var bool = items == null;
                  return ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      // ignore: unnecessary_null_comparison
                      itemCount: bool ? 0 : items.length,
                      itemBuilder: (context, index) {
                        return filterData == null || filterData == ""
                            ? GestureDetector(
                                onTap: () {
                                  String history =
                                      items[index].history.toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailCerita(
                                              nama: items[index].nama.toString(),
                                              history: history,
                                              img: items[index].img.toString())));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 14),
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                items[index].img.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                items[index].nama.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : '${items[index].nama}'
                                    .toLowerCase()
                                    .contains(filterData!.toLowerCase())
                                ? GestureDetector(
                                    onTap: () {
                                      String history =
                                          items[index].history.toString();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailCerita(
                                                  nama: items[index].nama.toString(),
                                                  history: history,
                                                  img: items[index].img.toString())));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 4,
                                      margin: const EdgeInsets.all(10),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 14),
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    items[index].img.toString(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    items[index]
                                                        .nama
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18),
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
