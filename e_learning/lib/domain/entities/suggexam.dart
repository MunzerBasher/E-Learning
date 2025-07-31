import 'package:flutter/material.dart'; // Import for Color

class ExamDetails {
  final String title;
  final String schedule;
  final Color cardBackgroundColor;

  ExamDetails({
    required this.title,
    required this.schedule,
    required this.cardBackgroundColor,
  });
}

// Now, let's create an object using your data:
ExamDetails finalExam = ExamDetails(
  title: 'الاختبار النهائي',
  schedule: 'مجدول في 10 يونيو',
  cardBackgroundColor: const Color(0xFFF5F5F5),
);