class Recipe{
  String id;
  String title;
  String subTitle;
  String contents;
  String time;

  Recipe({this.id, this.title, this.subTitle, this.contents, this.time});

  Recipe.fromJson(Map<String, dynamic> json)
    :id = json['id'],
    title = json['title'], //레시피명
    subTitle = json['subTitle'],//부제목
    contents = json['contents'],//내용
    time = json['time'];//조리시간
}