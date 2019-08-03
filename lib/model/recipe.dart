class Recipe{
  String title;
  String subTitle;
  String contents;
  String time;

  Recipe({this.title, this.subTitle, this.contents, this.time});

  Recipe.fromJson(Map json)
    :title = json['title'],
    subTitle = json['subTitle'],
    contents = json['contents'],
    time = json['time'];
}