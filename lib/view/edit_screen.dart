import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintestproject/model/crud_model.dart';
import 'package:maintestproject/services/crud_service.dart';

class Editscreen extends StatefulWidget {
 final String id;
  final CrudModel crmodel;
  const Editscreen({super.key, required this.crmodel, required this.id});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  final TextEditingController nameController = TextEditingController( );
  final TextEditingController placeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  File? _image;

  final ImagePicker picker = ImagePicker();

  Future<void> editpickImage() async {
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
                    ? const Text('no image selected')
                    : Image.file(_image!)),
            ElevatedButton(
                onPressed: editpickImage, child: const Text('pick image')),
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
                onPressed: ()  {
                  // if (_image == null) {
                  //   log('all fields are required');
              String  imageurl =  widget.crmodel.image.toString();
                  CrudService().editdata(CrudModel(age: ageController.text,name: nameController.text,place: placeController.text,image: imageurl),widget.id );
                  },
                  
                // },
                child: const Text('update')),
          ],
        ),
      ),
    );
  }
}
