class ScreenShotModel {
  final int id;
  final String imageId;

  ScreenShotModel(this.id, this.imageId);

  ScreenShotModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        imageId = json["imageId"];
}
