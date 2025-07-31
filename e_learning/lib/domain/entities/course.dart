class Course {
  final String title;
  final String instructor;
  final String duration;
  final int price;

  Course({
    required this.title,
    required this.instructor,
    required this.duration,
    required this.price,
  });

  /// إنشاء كائن [Course] من خريطة JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      duration: json['duration'] as String,
      price: json['price'] as int,
    );
  }

  /// تحويل كائن [Course] إلى خريطة JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'instructor': instructor,
      'duration': duration,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'Course(title: $title, instructor: $instructor, duration: $duration, price: $price)';
  }
}