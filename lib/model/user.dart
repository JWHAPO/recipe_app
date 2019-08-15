class User{
  String id;
  String name;
  String grade;
  String email;

  User({this.id, this.name, this.grade, this.email});

  User.fromJson(Map json)
    :id = json['id'],
    name = json['name'],
    grade = json['grade'],
    email = json['email'];
}