class Course {
  int? id;
  String? code;
  String? name;
  int? shiftId;
  String? description;
  int? vacancies;
  Shift? shift;

  Course(
      {this.id,
      this.code,
      this.name,
      this.shiftId,
      this.description,
      this.vacancies,
      this.shift});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    shiftId = json['shiftId'];
    description = json['description'];
    vacancies = json['vacancies'];
    shift = json['shift'] != null ? Shift.fromJson(json['shift']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['shiftId'] = shiftId;
    data['description'] = description;
    data['vacancies'] = vacancies;
    if (shift != null) {
      data['shift'] = shift!.toJson();
    }
    return data;
  }
}

class Shift {
  String? teacher;
  String? schedule;
  String? letter;

  Shift({this.teacher, this.schedule, this.letter});

  Shift.fromJson(Map<String, dynamic> json) {
    teacher = json['teacher'];
    schedule = json['schedule'];
    letter = json['letter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher'] = teacher;
    data['schedule'] = schedule;
    data['letter'] = letter;
    return data;
  }
}

class Student {
  int? id;
  String? name;
  String? cui;
  String? email;
  String? password;

  Student({this.id, this.name, this.cui, this.email, this.password});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cui = json['cui'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cui'] = cui;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class Enrollment {
  int? id;
  int? studentId;
  String? studentCUI;
  int? courseId;
  Course? course;

  Enrollment(
      {this.id, this.studentId, this.studentCUI, this.courseId, this.course});

  Enrollment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['studentId'];
    studentCUI = json['studentCUI'];
    courseId = json['courseId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['studentId'] = studentId;
    data['studentCUI'] = studentCUI;
    data['courseId'] = courseId;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}
