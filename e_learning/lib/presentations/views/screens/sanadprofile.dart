import 'package:e_learning/presentations/views/screens/settingsapp.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // In RTL, the leading icon moves to the right. We want settings on the right.
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // Settings icon
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
          ),
        ],
        title: const Text('سند'), // Translated: 'Sanad'
        centerTitle: true,
        // No leading widget needed as settings is now in actions
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the right in RTL
            children: [
              // User Information Section
              const CustomTitle(title: 'المعلومات الشخصية'), // Translated: 'Personal Information'
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              _buildUserInfoCard(),
              SizedBox(height: MediaQuery.of(context).size.height / 25),

              // Your Progress Section
              const CustomTitle(title: 'إنجازاتي'), // Translated: 'My Achievements'
              const SizedBox(height: 15),
              _buildProgressCards(),
              const SizedBox(height: 30),

              // Account Actions Section
              _buildSectionTitle(
                  'إجراءات الحساب', // Translated: 'Account Actions'
                  null,
                  icon: Icons.person_add_alt_1_outlined),
              const SizedBox(height: 15),
              _buildAccountActionsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String? hashtag, {IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icon should appear on the right side in RTL for a leading visual
        if (icon != null) Icon(icon, color: Colors.black54),
        if (icon != null) const SizedBox(width: 8), // Spacing after icon
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(), // Pushes hashtag to the far left
        if (hashtag != null)
          Text(
            hashtag,
            style: TextStyle(
              fontSize: 14,
              color: Color(int.parse(hashtag.replaceAll('#', '0xFF'))),
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  Widget _buildUserInfoCard() {
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar - remains on the right in RTL
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/user_avatar.png'), // Replace with actual avatar image
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'NQ', // Placeholder initials
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15), // Spacing after avatar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // Align name and roles to the left in RTL
                  children: [
                    const Text(
                      'منذر بشير', // Translated: 'Munther Bashir'
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.right, // Ensure text alignment
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Align tags to the left in RTL
                      children: [
                        _buildUserRoleTag('طالب', isSelected: true), // Translated: 'Student'
                        const SizedBox(width: 10),
                        _buildUserRoleTag('مدرس', isSelected: false), // Translated: 'Teacher'
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
              'متوسط', // Transliteration and color code
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3EE2C1), // Closest color from 3EE2C1C
                ),
                textAlign: TextAlign.right, // Ensure text alignment
              ),
              Row(
                children: const [
                  Text(
                    'البريد الإلكتروني - الهاتف', // Translated: 'Email - Phone'
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right, // Ensure text alignment
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.phone_outlined,
                      size: 18, color: Colors.black54), // Icon on the left for RTL
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserRoleTag(String role, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4A34AF) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        role,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProgressCards() {
    return Row(
      children: [
        Expanded(
          child: _buildProgressItem(
            title: 'الاختبارات التي تم إجراؤها', // Translated: 'Quizzes Taken'
            value: '1300',
            subtitle1: 'دورات', // Translated: 'Courses'
            subtitle2: 'مباشرة مكتملة', // Translated: 'Live Completed'
            subtitle3: 'جلسات مباشرة حضرت', // Translated: 'Live Sessions Attended'
            additionalText: '', // Transliteration for the code/text
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildProgressItem(
            title: 'سوفت ', // Transliteration: 'Soft FAF3E0'
            value: '3400',
            subtitle1: 'مكتملة', // Translated: 'Completed'
            subtitle2: 'مفكرات', // Translated: 'Notebooks'
            subtitle3: 'تم تنزيلها', // Translated: 'Downloaded'
            additionalText: '', // Transliteration for the code/text
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressItem({
    required String title,
    required String value,
    required String subtitle1,
    required String subtitle2,
    required String subtitle3,
    required String additionalText,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
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
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the right in RTL
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
          const SizedBox(height: 10),
          Text(
            subtitle1,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
          Text(
            subtitle2,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
          Text(
            subtitle3,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
          const SizedBox(height: 10),
          Text(
            additionalText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
            textAlign: TextAlign.right, // Ensure text alignment
          ),
        ],
      ),
    );
  }

  Widget _buildAccountActionsCard() {
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
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement edit profile logic
          print('Edit Profile button pressed!');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A34AF), // Purple button color
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0, // No extra shadow for the button itself
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Icons are naturally mirrored in RTL, but we're explicitly placing them
            Icon(Icons.widgets_outlined,
                color: Colors.white,
                size: 24), // Placeholder for the left icon in RTL
            SizedBox(width: 10), // Spacing after icon
            Text(
              'تعديل الملف الشخصي', // Translated: 'Edit Profile'
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10), // For symmetrical spacing
            Icon(Icons.edit,
                color: Colors.white, size: 24), // Edit icon for right in RTL
          ],
        ),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // Align title to the right in RTL
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}