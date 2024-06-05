import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:maintestproject/model/crud_model.dart';

class CrudService {
  String collectionref = 'crudservice';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Reference firebaseStorage = FirebaseStorage.instance.ref();

  late final CollectionReference<CrudModel> studentref =
      firestore.collection(collectionref).withConverter<CrudModel>(
            fromFirestore: (snapshot, options) =>
                CrudModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<void> adddata(CrudModel model) async {
    await studentref.add(model);
  }

  Future<String> addimage(File image) async {
    String imageName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference imageFolder = firebaseStorage.child('images');
    Reference uploadedimage = imageFolder.child("$imageName.jpg");

    try {
      await uploadedimage.putFile(image);
      String url = await uploadedimage.getDownloadURL();
      return url;
    } catch (e) {
      throw Exception('failed to upload image $e');
    }
  }

  Stream<QuerySnapshot<CrudModel>> getdata() {
    return studentref.snapshots();
  }

  Future<void> deletedata(String id) async {
    await studentref.doc(id).delete();
  }

  Future<void> editdata(CrudModel model, String id) async {
    await studentref.doc(id).update(model.toJson());
  }

  Future editimage(String imageurl, File editimg) async {
    Reference editimgref = FirebaseStorage.instance.refFromURL(imageurl);
    await editimgref.putFile(editimg);

    String newurl = await editimgref.getDownloadURL();
    return newurl;
  }
}
