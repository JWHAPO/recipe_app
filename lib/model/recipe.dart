class Recipe{
  String title;
  String subTitle;
  String contents;
  String time;

  Recipe({this.title, this.subTitle, this.contents, this.time});

  Recipe.fromJson(Map json)
    :title = json['title'], //레시피명
    subTitle = json['subTitle'],//부제목
    contents = json['contents'],//내용
    time = json['time'];//조리시간
}