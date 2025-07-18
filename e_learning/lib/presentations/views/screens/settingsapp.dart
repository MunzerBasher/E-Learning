import 'package:flutter/material.dart';


class SanadSettingsApp extends StatelessWidget {
  const SanadSettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanad Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // لون الخلفية الفاتح
        fontFamily: 'Roboto', // يمكنك تغيير الخط
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: أضف منطق الرجوع
            Navigator.pop(context);
            print('Back button pressed!');
          },
        ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              _buildSettingsCard([
                _buildSettingsItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  trailingWidget: Switch(
                    value: _notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                      // TODO: أضف منطق حفظ إعداد الإشعارات
                      print('Notifications toggled: $value');
                    },
                    activeColor: const Color(0xFF4A34AF), // لون التبديل النشط
                  ),
                ),
                _buildDivider(),
                _buildSettingsItem(
                  icon: Icons.language,
                  title: 'Language',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة اختيار اللغة
                    print('Language setting tapped!');
                  },
                ),
                _buildDivider(),
                _buildSettingsItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  trailingWidget: Switch(
                    value: _darkModeEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                      // TODO: أضف منطق تفعيل الوضع الداكن
                      print('Dark Mode toggled: $value');
                    },
                    activeColor: const Color(0xFF4A34AF),
                  ),
                ),
              ]),
              const SizedBox(height: 30),

              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              _buildSettingsCard([
                _buildSettingsItem(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة تعديل الملف الشخصي
                    print('Edit Profile tapped!');
                  },
                ),
                _buildDivider(),
                _buildSettingsItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة تغيير كلمة المرور
                    print('Change Password tapped!');
                  },
                ),
                _buildDivider(),
                _buildSettingsItem(
                  icon: Icons.security,
                  title: 'Privacy Policy',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة سياسة الخصوصية
                    print('Privacy Policy tapped!');
                  },
                ),
              ]),
              const SizedBox(height: 30),

              const Text(
                'Support',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              _buildSettingsCard([
                _buildSettingsItem(
                  icon: Icons.help_outline,
                  title: 'Help & FAQ',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة المساعدة والأسئلة الشائعة
                    print('Help & FAQ tapped!');
                  },
                ),
                _buildDivider(),
                _buildSettingsItem(
                  icon: Icons.contact_support_outlined,
                  title: 'Contact Us',
                  trailingWidget: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  onTap: () {
                    // TODO: انتقل إلى صفحة اتصل بنا
                    print('Contact Us tapped!');
                  },
                ),
              ]),
              const SizedBox(height: 30),

              // زر تسجيل الخروج
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: أضف منطق تسجيل الخروج
                    print('Logout button pressed!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE25B5B), // لون أحمر لزر تسجيل الخروج
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xFF4A34AF)), // أيقونة بنفسجية
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailingWidget != null) trailingWidget,
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        height: 1,
        color: Colors.grey.shade200,
      ),
    );
  }
}