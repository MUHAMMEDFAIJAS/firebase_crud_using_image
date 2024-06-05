class CrudModel {
  String? name;
  String? place;
  String? age;
  String? image;

  CrudModel({
    this.name,
    this.age,
    this.image,
    this.place,
  });

  CrudModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    place = json['place'];
    age = json['age'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'place': place,
      'age': age,
      'image': image,
    };
  }
}
