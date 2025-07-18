import 'package:flutter/material.dart';

class QuizCompleteApp extends StatelessWidget {
  const QuizCompleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Complete',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // لون الخلفية
        fontFamily: 'Roboto', // يمكنك تغيير الخط
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // لجعل الـ AppBar شفاف
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const QuizCompleteScreen(),
    );
  }
}

class QuizCompleteScreen extends StatelessWidget {
  const QuizCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            // TODO: أضف منطق العودة إلى الشاشة السابقة
            print('Back button pressed!');
          },
        ),
        title: const Text(
          'Sanad',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              '#0E4429', // النص على يمين الـ AppBar
              style: TextStyle(color: Color(0xFF0E4429), fontSize: 14),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Quiz Complete',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),

              // دائرة التقدم
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFFE25B5B), Color(0xFF4EEAD9)], // الألوان المتدرجة للدائرة
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ).createShader(bounds);
                        },
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 0.85), // 85% كقيمة نهائية
                          duration: const Duration(seconds: 1),
                          builder: (context, value, child) {
                            return CircularProgressIndicator(
                              value: value,
                              strokeWidth: 15,
                              backgroundColor: Colors.grey.shade200, // لون خلفية الدائرة
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white), // اللون الذي سيتم تطبيق الـ Shader عليه
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '85%',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '0E4429', // النص أسفل النسبة المئوية
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0E4429),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                '17 of 20 Correct',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Great job! You\'re ready for the\nnext challenge.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // زر Review Answers
              ElevatedButton(
                onPressed: () {
                  // TODO: أضف منطق مراجعة الإجابات هنا
                  print('Review Answers button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF23194B), // لون الزر الداكن
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Review Answers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // زر Retake Quiz
              ElevatedButton(
                onPressed: () {
                  // TODO: أضف منطق إعادة الاختبار هنا
                  print('Retake Quiz button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE2E0EE), // لون الزر الفاتح
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Retake Quiz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF23194B), // لون النص الداكن
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // زر D4AF37 (بافتراض أنه زر)
              ElevatedButton(
                onPressed: () {
                  // TODO: أضف منطق لهذا الزر (غير واضح من الصورة)
                  print('D4AF37 button pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A34AF), // لون الزر البنفسجي
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'D4AF37',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // زر Next Quiz (في الأسفل)
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // TODO: أضف منطق الانتقال للاختبار التالي
                    print('Next Quiz button pressed!');
                  },
                  child: const Text(
                    'Next Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF23194B),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}