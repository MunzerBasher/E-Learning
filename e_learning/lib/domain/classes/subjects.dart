import 'package:e_learning/domain/entities/subject.dart';

class SubjectsList {

  static List<Subject> subjects = [
    Subject(id: 1, name: 'عربي'),
    Subject(id: 6, name: "انجليزي"),
    Subject(id: 7, name: "فيزياء"),
    Subject(id: 7, name: "كيمياء"),
    Subject(id: 7, name: "رياضيات"),
    Subject(id: 7, name: "هندسية"),
    Subject(id: 7, name: "أحياء"),
    Subject(id: 7, name: "التربية الإسلامية"),
  ];

  static Map<String, int> spicaliztion = {" القسم علمي " : 1, " القسم الأدبي": 2};


  static List<Subject> artSubjects = [
    Subject(id: 7, name: "التربية الإسلامية"),
    Subject(id: 4, name: "تاريخ"),
    Subject(id: 5, name: 'عربي'),
    Subject(id: 6, name: "انجليزي"),
    Subject(id: 7, name: "فيزياء"),
    Subject(id: 8, name: "تاريخ"),
    Subject(id: 7, name: "رياضيات"),
    Subject(id: 7, name: "عسكرية"),
    Subject(id: 7, name: "دراسات إسلامية"),
  ];
}
