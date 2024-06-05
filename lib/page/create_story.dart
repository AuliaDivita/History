import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateStoryPage extends StatefulWidget {
  @override
  _CreateStoryPageState createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  final TextEditingController _storyController = TextEditingController();
  String _title = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Story'),
        backgroundColor: Color(0xff392850),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Judul Cerita Anda',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan judul cerita...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Tambahkan Foto',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () async {
                  final imagePicker = ImagePicker();
                  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

                  if (pickedImage != null) {
                    setState(() {
                      _imageUrl = pickedImage.path;
                    });
                  }
                },
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.grey,
                  child: _imageUrl.isNotEmpty
                      ? Image.file(File(_imageUrl))
                      : Icon(Icons.add_a_photo, size: 48.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Tulis Cerita Anda',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _storyController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Tulis cerita Anda di sini...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Simpan cerita, judul, dan URL gambar ke database atau lakukan tindakan yang sesuai di sini
                  String title = _title;
                  String newStory = _storyController.text;
                  String imageUrl = _imageUrl;

                  // Contoh: Simpan cerita, judul, dan URL gambar ke database
                  // database.saveStory(title, newStory, imageUrl);

                  // Setelah menyimpan cerita, kembali ke halaman sebelumnya
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff392850), // Ubah warna latar belakang tombol menjadi merah
                ),
                child: Text('Simpan Cerita'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }
}
