class RecetteModel{
   int? id;
   String? youtubeLink;
   String? videoTitle;
   String? img;
   String? tags;

   RecetteModel(this.id,this.youtubeLink,this.videoTitle,
     this.img
   );

   RecetteModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    youtubeLink =json['youtubeLink'];
    videoTitle = json['videoTitle'];
    img = json['img'];
    tags = json['tags'];
  }
}