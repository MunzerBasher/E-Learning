import 'package:flutter/material.dart';

class SanadLiveApp extends StatelessWidget {
  const SanadLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanad Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, // You can adjust this color
        scaffoldBackgroundColor:
            const Color(0xFFF0F0F0), // Light background color
        fontFamily: 'Roboto', // You can change the font
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          titleTextStyle: TextStyle(
            color: Color(0xFF2E4C33), // Dark green for "Sanad Live"
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const SanadLiveScreen(),
    );
  }
}

class SanadLiveScreen extends StatelessWidget {
  const SanadLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {},
        ),
        title: const Text('Sanad Live'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Live Stream Player Section
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black, // Placeholder for video player
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
                      left: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFD4AF37), // Gold color for Live Now tag
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.circle, color: Colors.red, size: 10),
                            SizedBox(width: 5),
                            Text(
                              'Live Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
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
                'Mathematics Basics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Mr. Johnson',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Join Live Button
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF2E4C33), // Dark green button color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.videocam, color: Colors.white, size: 24),
                label: const Text(
                  'Join Live',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Upcoming Sessions Title
              const Text(
                'Upcoming Sessions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // List of Upcoming Sessions
              _buildSessionCard(
                imagePath:
                    'assets/organic_chemistry.jpg', // Placeholder for organic chemistry image
                title: 'Organic Chemistry',
                instructor: 'Dr. Williams',
                subject: 'Chemistry',
                time: 'Today at 6:00 PM',
              ),
              const SizedBox(height: 15),
              _buildSessionCard(
                imagePath:
                    'assets/world_history.jpg', // Placeholder for world history image
                title: 'World History Overview',
                instructor: 'Ms. Davis',
                subject: 'History',
                time: 'Today at 8:00 PM',
              ),
              const SizedBox(height: 15),
              _buildSessionCard(
                imagePath:
                    'assets/physics.jpg', // Placeholder for physics image
                title: 'Physics Fundamentals',
                instructor: 'Dr. Smith',
                subject: 'Physics',
                time: 'Tomorrow at 10:00 AM',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        selectedItemColor:
            const Color(0xFF2E4C33), // Dark green for selected icon
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Assuming the middle (Play) icon is selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '', // Empty label as per design
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.desktop_mac_outlined), // Represents courses/desktop icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill, size: 40), // Larger play icon
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
        onTap: (index) {},
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
              imagePath, // Use actual image paths
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback for missing images
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  '$instructor • $subject',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {
                // TODO: Add set reminder logic
                print('Set Reminder for $title');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color(0xFFD4AF37), width: 1.5), // Gold border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              ),
              child: const Text(
                'Set Reminder',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37), // Gold text
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
