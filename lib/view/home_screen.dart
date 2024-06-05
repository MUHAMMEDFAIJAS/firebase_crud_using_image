import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintestproject/model/crud_model.dart';
import 'package:maintestproject/services/crud_service.dart';
import 'package:maintestproject/view/add_screen.dart';
import 'package:maintestproject/view/edit_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ));
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: CrudService().getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('error ${snapshot.hasError}');
            } else {
              List<QueryDocumentSnapshot<CrudModel>> cruddoc =
                  snapshot.data?.docs ?? [];
              if (cruddoc.isEmpty) {
                return const Center(
                  child: Text('no data available'),
                );
              }

              return ListView.builder(
                itemCount: cruddoc.length,
                itemBuilder: (context, index) {
                  final data = cruddoc[index].data();
                  final id = cruddoc[index].id;
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(data.image!),
                    ),
                    title: Text(data.name!),
                    subtitle: Text(data.age!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Editscreen(
                                    crmodel: CrudModel(
                                  age: data.age,
                                  name: data.name,
                                  place: data.place,
                                  image: data.image,
                                ), id: id,),
                              ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              CrudService().deletedata(id);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
