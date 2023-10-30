class RecetteModel {
  int? id;
  String? youtubeLink;
  String? videoTitle;
  String? videoDescription;
  String? time;
  String? img;
  String? tags;
  String? rate;
  String? cal;

  RecetteModel(
      this.id,
      this.youtubeLink,
      this.videoTitle,
      this.videoDescription,
      this.time,
      this.img,
      this.tags,
      this.rate,
      this.cal);

  RecetteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    youtubeLink = json['youtubeLink'];
    videoTitle = json['videoTitle'];
    videoDescription = json['description'];
    time = json['time'];
    img = json['img'];
    tags = json['tags'];
    rate = json['rate'];
    cal = json['cals'];
  }
}
