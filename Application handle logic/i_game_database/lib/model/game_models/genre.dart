class GenreModel {
  final id;
  final name;

  GenreModel(this.id, this.name);

  GenreModel.fromJson(Map<String, dynamic> json)
      : id =json['id'],
        name = json['name'];
}