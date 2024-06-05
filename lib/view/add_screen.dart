import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintestproject/model/crud_model.dart';
import 'package:maintestproject/services/crud_service.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  File? _image;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: _image == null
                  ? const Text('No image selected')
                  : Image.file(_image!),
            ),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick Image'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                hintText: 'Place',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_image == null) {
                  log('all fiealds are required');
                  // return;
                }
                String imageurl = await CrudService().addimage(_image!);
                await CrudService().adddata(CrudModel(
                  age: ageController.text,
                  name: nameController.text,
                  place: placeController.text,
                  image: imageurl,
                ));
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
