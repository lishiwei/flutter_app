class AdoptInfo {
  String publisherName;
  String publisherPhoto;
  String relationShip;
  String time;
  String publishContent;
  List<String> petPhotos = [];
  List<String> petTips = [];
  List<Comment> comments = [];
  String petName;
  String petAge;
  String petSexy;
  String petAddress;
  String petAdpotStatus;
bool isCollected ;
  AdoptInfo(
      this.publisherName,
      this.publisherPhoto,
      this.relationShip,
      this.time,
      this.publishContent,
      this.petPhotos,
      this.petTips,
      this.petName,
      this.petAge,
      this.petSexy,
      this.petAddress,
      this.petAdpotStatus,this.isCollected,this.comments);
}
class CatBean {
  String name;
  String url;
  String age;
  String sex;

  CatBean(this.name, this.url, this.age, this.sex);
}

class PetAdoptionBean {
  String title;
  String number;

  PetAdoptionBean(this.title, this.number);
}
class Comment{
  String commentator;
  String commentatorPhoto;
  String commentatortime;
  String comment;

  Comment(this.commentator, this.commentatorPhoto, this.commentatortime,
      this.comment);
}