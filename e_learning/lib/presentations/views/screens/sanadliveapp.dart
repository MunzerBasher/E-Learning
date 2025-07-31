import 'package:flutter/material.dart';

class SanadLiveScreen extends StatelessWidget {
  const SanadLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                color: Colors.black54),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
       // title: const Text("المحاضرات المباشرة"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.black54),
          onPressed: () {
            // TODO: Add search functionality
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Live Stream Player Section
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white54,
                      size: 70,
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFD4AF37),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'بث مباشر الآن',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.circle, color: Colors.red, size: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Mathematics Basics section
              const Text(
                'أساسيات الرياضيات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 5),
              const Text(
                'الأستاذة آمال الطيب', // Changed from 'Mr. Johnson' to a common Sudanese female teacher name
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 20),

              // Join Live Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement join live logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2E4C33),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  label: const Text(
                    'انضم إلى البث المباشر',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.videocam, color: Colors.white, size: 24),
                ),
              ),
              const SizedBox(height: 30),

              // Upcoming Sessions Title
              const Text(
                'الجلسات القادمة',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 20),

              // List of Upcoming Sessions
              _buildSessionCard(
                imagePath:
                    'assets/organic_chemistry.jpg',
                title: 'الكيمياء العضوية',
                instructor: 'الدكتور أسامة بابكر', // Changed from 'Dr. Williams' to a common Sudanese male doctor name
                subject: 'الكيمياء',
                time: 'اليوم الساعة 6:00 مساءً',
              ),
              const SizedBox(height: 15),
              _buildSessionCard(
                imagePath:
                    'assets/world_history.jpg',
                title: 'نظرة عامة على تاريخ العالم',
                instructor: 'الأستاذة نادية هاشم', // Changed from 'Ms. Davis' to a common Sudanese female teacher name
                subject: 'التاريخ',
                time: 'اليوم الساعة 8:00 مساءً',
              ),
              const SizedBox(height: 15),
              _buildSessionCard(
                imagePath:
                    'assets/physics.jpg',
                title: 'أساسيات الفيزياء',
                instructor: 'الدكتور عوض الكريم', // Changed from 'Dr. Smith' to a common Sudanese male doctor name
                subject: 'الفيزياء',
                time: 'غدًا الساعة 10:00 صباحًا',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            const Color(0xFF2E4C33),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.desktop_mac_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
        onTap: (index) {
          // TODO: Implement navigation logic for bottom bar
        },
      ),
    );
  }

  Widget _buildSessionCard({
    required String imagePath,
    required String title,
    required String instructor,
    required String subject,
    required String time,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade300,
                  child:
                      const Icon(Icons.image_not_supported, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 5),
                Text(
                  '$instructor • $subject',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              onPressed: () {
                print('Set Reminder for $title');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color(0xFFD4AF37), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              ),
              child: const Text(
                'تعيين تذكير',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}