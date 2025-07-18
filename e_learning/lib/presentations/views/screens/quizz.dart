import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? _selectedAnswer; // لتتبع الإجابة المختارة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // الشعار وأيقونة القائمة
              _buildAppBar(),
              const SizedBox(height: 30),

              // عنوان السؤال
              const Text(
                'Quiz Question',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // الألوان المرئية (لا تمثل شيئًا عمليًا في التطبيق)
              _buildColorTags(),
              const SizedBox(height: 20),

              // شريط التقدم
              _buildProgressBar(75), // يمكنك تمرير النسبة المئوية هنا
              const SizedBox(height: 30),

              // نص السؤال
              const Text(
                'What is the boiling point of water?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),

              // خيارات الإجابات
              _buildAnswerOption('A. 90°C', 'A'),
              const SizedBox(height: 15),
              _buildAnswerOption('B. 100°C', 'B'),
              const SizedBox(height: 15),
              _buildAnswerOption('C. 110°C', 'C'),
              const SizedBox(height: 15),
              _buildAnswerOption('D. 120°C', 'D'),
              const SizedBox(height: 30),

              // زر Next
              ElevatedButton(
                onPressed: () {
                  // TODO: أضف منطق الانتقال للسؤال التالي هنا
                  print('Next button pressed! Selected answer: $_selectedAnswer');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A34AF), // لون الزر الداكن
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.bars, color: Colors.black54, size: 20), // أيقونة القائمة
            onPressed: () {
              // TODO: أضف منطق فتح القائمة الجانبية هنا
              print('Menu button pressed!');
            },
          ),
        ),
        Row(
          children: [
            // يمكنك استبدال هذه بـ Image.asset('assets/sanad_logo.png')
            // بعد إضافة الشعار إلى مجلد assets وتحديده في pubspec.yaml
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF4A34AF), // لون مشابه للشعار في الصورة
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.attach_money, color: Colors.white, size: 20), // أيقونة مؤقتة للشعار
            ),
            const SizedBox(width: 8),
            const Text(
              'Sanad',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(width: 40), // للموازنة مع أيقونة القائمة على اليسار
      ],
    );
  }

  Widget _buildColorTags() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '#0E4429',
          style: TextStyle(color: Color(0xFF0E4429), fontSize: 12),
        ),
        SizedBox(width: 10),
        Text(
          '#E2C290',
          style: TextStyle(color: Color(0xFFE2C290), fontSize: 12),
        ),
        SizedBox(width: 10),
        Text(
          '#CCARnt', // هذا يبدو وكأنه نص عشوائي في الصورة
          style: TextStyle(color: Color(0xFFCCAA80), fontSize: 12), // لون افتراضي
        ),
        SizedBox(width: 10),
        Text(
          '#D4AF37',
          style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildProgressBar(int percentage) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: const Color(0xFFE2E0EE), // لون الخلفية لشريط التقدم
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A34AF)), // لون التقدم
            minHeight: 15,
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerOption(String text, String value) {
    bool isSelected = _selectedAnswer == value;
    bool isCorrect = value == 'B'; // افتراض أن الإجابة الصحيحة هي B لغرض العرض
    Color borderColor;
    Color textColor;
    Widget? trailingIcon;
    Color backgroundColor = Colors.white;

    if (isSelected) {
      if (isCorrect) {
        borderColor = Colors.green; // لون أخضر للإجابة الصحيحة المختارة
        textColor = Colors.green;
        trailingIcon = const Icon(Icons.check_circle, color: Colors.green);
        backgroundColor = Colors.green.withOpacity(0.1);
      } else {
        borderColor = Colors.red; // لون أحمر للإجابة الخاطئة المختارة
        textColor = Colors.red;
        trailingIcon = const Icon(Icons.cancel, color: Colors.red);
        backgroundColor = Colors.red.withOpacity(0.1);
      }
    } else {
      borderColor = const Color(0xFFDCDCDC); // لون حدود افتراضي
      textColor = Colors.black87;
    }

    // هذه الألوان #D4F377 و #FAF3E0 لا تظهر كجزء من الإجابات نفسها في الصورة
    // سأفترض أنها ألوان عشوائية أو لتصميمات مستقبلية.
    // إذا كان لها استخدام محدد، يرجى التوضيح.

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnswer = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (trailingIcon != null) trailingIcon,
          ],
        ),
      ),
    );
  }
}