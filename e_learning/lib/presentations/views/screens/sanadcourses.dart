import 'package:flutter/material.dart';

class SanadCoursesApp extends StatelessWidget {
  const SanadCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دورات سند', // Translated: 'Sanad Courses'
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // Light background color
        fontFamily: 'Roboto', // You can change the font
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      // Added for RTL support
      home: const Directionality(
        textDirection: TextDirection.rtl, // Set global text direction to RTL
        child: CoursesScreen(),
      ),
    );
  }
}

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  
  String _selectedTab = 'دوراتي'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const  Padding(
          padding: EdgeInsets.only(right: 16.0), // Changed to right for RTL
          // child: Image.asset(
          //   'assets/sanad_logo.png', // Replace this with your Sanad logo path
          //   height: 30,
          // ),
        ),
        title: const Text('سند'), // Translated: 'Sanad'
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert), // Can be a menu or options icon
            onPressed: () {
              // TODO: Add icon logic here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Remains start for RTL to align to right
            children: [
              const Text(
                'الدورات', // Translated: 'Courses'
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Your Courses / All Courses tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Changed to end for RTL alignment
                children: [
                  _buildTab('جميع الدورات'), // Translated: 'All Courses'
                  const SizedBox(width: 15),
                  _buildTab('دوراتي'), // Translated: 'Your Courses'
                ],
              ),
              const SizedBox(height: 20),
              // The text #0E4429
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Color(0xFF0E4429),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // List of courses
              Expanded(
                child: ListView(
                  children: [
                    _buildCourseCard(
                      courseName: "الرياضيات المتخصصة", // Translated: 'Course Name'
                      status: 'مكتملة', // Translated: 'Completed'
                      statusColor: Colors.green, // Color for "Completed" status
                      icon: Icons.school, // Graduation cap icon
                      iconBackgroundColor: const Color(0xFFD4AF37).withOpacity(0.2), // Icon background color
                      tagText: '100%',
                      tagColor: const Color(0xFF0E4429), // DE4429 tag color
                    ),
                    const SizedBox(height: 20),
                    _buildCourseCard(
                      courseName: "اللغة العربية", // Translated: 'Course Name'
                      status: 'قيد التقدم', // Translated: 'In Progress'
                      statusColor: Colors.orange, // Color for "In Progress" status
                      icon: Icons.school, // Graduation cap icon (can be changed)
                      iconBackgroundColor: Colors.blue.withOpacity(0.2), // Icon background color
                      tagText: '58%',
                      tagColor: const Color(0xFF0E4429), // DE4429 tag color
                    ),
                    const SizedBox(height: 20),
                    _buildCourseCard(
                      courseName: "الفيزياء", // Translated: 'Course Name'
                      status: 'لم تبدأ بعد', // Translated: 'Not Yet Started'
                      statusColor: Colors.grey, // Color for "Not Yet Started" status
                      icon: Icons.person, // Person icon for instructor
                      iconBackgroundColor: Colors.purple.withOpacity(0.2), // Icon background color
                      tagText: '0%', // Different tag
                      tagColor: const Color(0xFFD4AF37), // DEAF37 tag color
                    ),
                    const SizedBox(height: 20),
                    _buildCourseCard(
                      courseName: "الهندسية", // Translated: 'Instructor Name'
                      description: "دورت في مقدمة العلوم الهندسية", // Translated: 'Course Nour: 40E24441g\ndescription'
                      icon: Icons.person, // Person icon for instructor
                      iconBackgroundColor: Colors.pink.withOpacity(0.2), // Icon background color
                      tagText: '40%', // No tag in this card in the image
                      tagColor: const Color.fromARGB(255, 96, 95, 94), 
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = (_selectedTab == title);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.grey.shade300) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black87 : Colors.grey.shade600,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 3,
                width: 30, // Width of the purple line under the text
                decoration: BoxDecoration(
                  color: const Color(0xFF4A34AF), // Color of the purple line
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String courseName,
    String? status,
    Color? statusColor,
    required IconData icon,
    required Color iconBackgroundColor,
    required String tagText,
    required Color tagColor,
    String? description,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 30, color: Colors.black54), // Icon color
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Remains start for RTL to align to right
              children: [
                Text(
                  courseName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (status != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 15,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                if (description != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (tagText.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: tagColor.withOpacity(0.1), // Tag background color
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tagText,
                style: TextStyle(
                  fontSize: 12,
                  color: tagColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey), // Changed to arrow_back_ios for RTL
        ],
      ),
    );
  }
}