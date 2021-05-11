import 'dart:convert';

HomeInfoList homeInfoListFromJson(String str) =>
    HomeInfoList.fromJson(json.decode(str));

String homeInfoListToJson(HomeInfoList data) => json.encode(data.toJson());

class HomeInfoList {
  HomeInfoList({
    this.title,
    this.link,
    this.image,
    this.playLink,
  });

  String title;
  String link;
  String image;
  List<String> playLink;

  factory HomeInfoList.fromJson(Map<String, dynamic> json) => HomeInfoList(
        title: json["title"],
        link: json["link"],
        image: json["image"],
        playLink: List<String>.from(json["playLink"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "image": image,
        "playLink": List<dynamic>.from(playLink.map((x) => x)),
      };
}
