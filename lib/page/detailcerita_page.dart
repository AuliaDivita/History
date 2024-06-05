import 'package:flutter/material.dart';

class DetailCerita extends StatelessWidget {
  final String nama, history, img;

  const DetailCerita({
    Key? key,
    required this.nama,
    required this.history,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 296,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SafeArea(
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 250),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Sejarah Nasional :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Judul : $nama",
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Isi Cerita : $history",
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
