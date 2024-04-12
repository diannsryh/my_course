class Courses {
  late int? id;
  late String title;
  Courses(this.id, this.title);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
    };
    return map;
  }

  Courses.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}
