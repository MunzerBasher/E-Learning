import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'سند', // Translated from 'Sanad'
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black87)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            SizedBox(height: 12),
            Text(
              'التدريب', // Translated from 'Training'
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            QuizCard(
              icon: Icons.smart_toy_outlined,
              title: 'اختبار بالذكاء الاصطناعي', // Translated from 'Quiz by AI'
              description: 'تدريب شخصي مدعوم بالذكاء الاصطناعي', // Translated from 'Personalized practice powered by AI'
              iconBgColor: Color(0xFFECECEC),
            ),
            SizedBox(height: 12),
            QuizCard(
              icon: Icons.edit_outlined,
              title: 'اختباراتنا', // Translated from 'Our Quizzes'
              description: 'اختبارات منسقة بواسطة مدربي سند', // Translated from 'Curated quizzes by Sanad instructors'
              iconBgColor: Color(0xFFECECEC),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconBgColor;

  const QuizCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconBgColor,
              radius: 24,
              child: Icon(icon, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down), // You might want to flip this icon for RTL languages if the layout reverses.
          ],
        ),
      ),
    );
  }
}