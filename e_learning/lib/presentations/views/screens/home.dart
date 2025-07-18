import 'package:e_learning/presentations/views/screens/sanadcourses.dart';
import 'package:e_learning/presentations/views/screens/sanadliveapp.dart';
import 'package:e_learning/presentations/views/screens/sanadnotebooksapp.dart';
import 'package:e_learning/presentations/views/screens/sanadprofile.dart';
import 'package:e_learning/presentations/views/screens/trainingscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // لتضمين أيقونات Font Awesome


class SanadApp extends StatelessWidget {
  const SanadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق سند', // ترجمة عنوان التطبيق
      debugShowCheckedModeBanner: false,
      // تفعيل دعم اللغة العربية والاتجاه من اليمين لليسار
      localizationsDelegates: const [
        
      ],
      supportedLocales: const [
        Locale('en', ''), // الإنجليزية
        Locale('ar', ''), // العربية
      ],
      locale: const Locale('ar', ''), // تعيين اللغة الافتراضية إلى العربية
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // لون الخلفية الفاتح
        fontFamily: 'Roboto', // يمكنك تغيير الخط
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // لتتبع العنصر المحدد في BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // هنا يمكنك إضافة منطق التنقل بين الصفحات
    print('تم النقر على المؤشر: $index'); // ترجمة رسالة الطباعة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // خلفية التطبيق الفاتحة
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
            children: [
              // شريط التطبيق المخصص
              _buildCustomAppBar(),
              SizedBox(height: MediaQuery.of(context).size.height/ 25),

              // قسم "لايف الآن"
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'لايف الآن', // الترجمة المطلوبة
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildLiveNowSection(),
              const SizedBox(height: 30),

              // قسم "اختبارات مقترحة"
               Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'اختبارات مقترحة', // ترجمة
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/25),
              _buildSuggestedExamsSection(),
              SizedBox(height: MediaQuery.of(context).size.height/25),

              // قسم "المفكرات"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      print('تم النقر على عرض الكل للمفكرات'); // ترجمة رسالة الطباعة
                    },
                    child: const Text(
                      'عرض الكل', // ترجمة
                      style: TextStyle(
                        color: Color(0xFF4A34AF), // لون أزرق/بنفسجي
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'المفكرات', // ترجمة
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/15),
              _buildNotebooksSection(),
              SizedBox(height: MediaQuery.of(context).size.height/15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        
        //CustomMenuBar(),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [    
            const Text(
              'سند', // ترجمة
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(width: 8),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFF3B5E3C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_book, color: Colors.white, size: 20), // أيقونة مؤقتة للشعار
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLiveNowSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,     
      reverse: true,
      child: Row(
        children: [
          _buildLiveNowCard(
            'assets/profile_ahmad.jpg', 
            'أحمد علي', // ترجمة
            'الرياضيات', // ترجمة
            'مراجعة الجبر', // ترجمة
            const Color(0xFFD4E7D6), 
          ),
          const SizedBox(width: 15),
          _buildLiveNowCard(
            'assets/profile_joon.jpg', 
            'جون', // ترجمة
            'الفيزياء', // ترجمة
            'الموجات والبصريات', // ترجمة
            const Color(0xFFFAEDCB), 
            isJoonCard: true, 
          ),
        ],
      ),
    );
  }

  Widget _buildLiveNowCard(String imagePath, String name, String subject, String topic, Color bgColor, {bool isJoonCard = false}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
        children: [
          Row(
            children: [
              // Avatar (على اليمين)
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(width: 15),
              // النص (على اليسار)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (!isJoonCard) // لا تعرض الموضوع والفرع لبطاقة Joon
                      Text(
                        '$subject\n$topic',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft, // تغيير المحاذاة لـ RTL (الزر سيكون على اليسار)
            child: ElevatedButton(
              onPressed: () {
                print('تم النقر على زر ${isJoonCard ? 'جون' : 'انضمام'} للمستخدم $name'); // ترجمة رسالة الطباعة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isJoonCard ? const Color(0xFFD3B765) : const Color(0xFFCCAA80), // لون زر "Joon" مختلف
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // عكس ترتيب الأيقونة والنص داخل الزر لـ RTL
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SanadLiveApp())),
                    child: Text(
                      isJoonCard ? 'جون' : 'انضمام', // ترجمة
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (isJoonCard) const SizedBox(width: 8),
                  if (isJoonCard)
                    const Icon(
                      FontAwesomeIcons.solidStar, // أيقونة نجمة لـ "Joon"
                      color: Colors.white,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSuggestedExamsSection() {
    return Column(
      children: [
        _buildExamCard(
          'الاختبار النهائي', // ترجمة
          'مجدول في 10 يونيو', // ترجمة
          const Color(0xFFF5F5F5), // لون خلفية البطاقة
        ),
        SizedBox(height: MediaQuery.of(context).size.height/25),
        _buildExamCard(
          'الاختبار التجريبي', // ترجمة
          'تم إنشاؤه في 18 مايو', // ترجمة
          const Color(0xFFF5F5F5), // لون خلفية البطاقة
        ),
      ],
    );
  }

  Widget _buildExamCard(String title, String subtitle, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           ElevatedButton(
            onPressed: () {
              print('تم النقر على زر ابدأ لـ $title'); // ترجمة رسالة الطباعة
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B5E3C), // لون زر "Start"
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            ),
            child: const Text(
              'ابدأ', // ترجمة
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          // زر "ابدأ" (يكون على اليسار في RTL)
         
        ],
      ),
    );
  }

  Widget _buildNotebooksSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // مهم لعكس اتجاه السكرول الأفقي لـ RTL
      child: Row(
        children: [
          _buildNotebookCard(
            'الفيزياء', // ترجمة
            'بواسطة منى إبراهيم', // ترجمة
            const Color(0xFFF5F5F5), // لون خلفية البطاقة
          ),
          const SizedBox(width: 15),
          _buildNotebookCard(
            'التاريخ', // ترجمة
            'بواسطة كريم صلاح', // ترجمة
            const Color(0xFFF5F5F5), // لون خلفية البطاقة
          ),
          const SizedBox(width: 15),
          // يمكنك إضافة المزيد من البطاقات هنا
        ],
      ),
    );
  }

  Widget _buildNotebookCard(String title, String author, Color bgColor) {
    return Container(
      width: 180, // عرض ثابت لبطاقة الدفتر
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            author,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft, // تغيير المحاذاة لـ RTL
            child: ElevatedButton(
              onPressed: () {
                print('تم النقر على زر ابدأ لمذكرة $title'); // ترجمة رسالة الطباعة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B5E3C), // لون زر "Start"
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'ابدأ', // ترجمة
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3B5E3C), // لون شريط التنقل السفلي الداكن
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: 
              (context) => const ProfileScreen())
            ), icon: const Icon(Icons.person)),
            label: 'الملف الشخصي', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const TrainingScreen())
            ), icon: const Icon(Icons.school)), // أو أيقونة تدريب مناسبة
            label: 'التدريب', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SanadCoursesApp())
            ), icon: const Icon(Icons.menu_book)), // أيقونة 'Learn' في الصورة تبدو كدفتر
            label: 'تعلم', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const NotebooksScreen())
            ), icon: const Icon(Icons.book)), // أو أيقونة Notebooks مناسبة
            label: 'المفكرات', // ترجمة
          ),
        ],
      ),
    );
  }
}

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 45,
     height: 45,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(15),
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(0.05),
           blurRadius: 8,
           offset: const Offset(0, 4),
         ),
       ],
     ),
     child: IconButton(
       icon: const Icon(FontAwesomeIcons.bars, color: Colors.black54, size: 22),
       onPressed: () {
        
       },
     ),
            );
  }
}









class CustomLog extends StatelessWidget{
  const CustomLog({super.key});


  Widget _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        
        //CustomMenuBar(),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [    
            const Text(
              'سند', // ترجمة
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(width: 8),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFF3B5E3C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_book, color: Colors.white, size: 20), // أيقونة مؤقتة للشعار
            ),
          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildCustomAppBar();
  }
  
}