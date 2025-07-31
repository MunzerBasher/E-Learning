import 'package:e_learning/presentations/bloc/Welcome/welcome_bloc.dart';
import 'package:e_learning/presentations/views/screens/welcome.dart';
import 'package:flutter/material.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0), 
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // No shadow
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                color: Colors.black54), 
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'الإعدادات', // 
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, 
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'عام', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.right, 
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/35),
                _buildSettingsCard([
                  _buildSettingsItem(
                    icon: Icons.notifications_outlined,
                    title: 'الإشعارات', 
                    trailingWidget: Switch(
                      value: _notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                        
                      },
                      activeColor: const Color(0xFF4A34AF), 
                    ),
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.language,
                    title: 'اللغة', 
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.grey), 
                    onTap: () {

                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'الوضع الداكن',
                    trailingWidget: Switch(
                      value: _darkModeEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _darkModeEnabled = value;
                        });
                       
                      },
                      activeColor: const Color(0xFF4A34AF),
                    ),
                  ),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height/35),

                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'الحساب', // Translated: 'Account'
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.right, 
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/35),
                _buildSettingsCard([
                  _buildSettingsItem(
                    icon: Icons.person_outline,
                    title: 'تعديل الملف الشخصي', 
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                      
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.lock_outline,
                    title: 'تغيير كلمة المرور', 
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                      
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.security,
                    title: 'سياسة الخصوصية', 
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                     
                    },
                  ),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height/35),

                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'الدعم', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.right, 
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/35),
                _buildSettingsCard([
                  _buildSettingsItem(
                    icon: Icons.help_outline,
                    title: 'المساعدة والأسئلة الشائعة', // Translated: 'Help & FAQ'
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                      
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.contact_support_outlined,
                    title: 'اتصل بنا', 
                    trailingWidget: const Icon(Icons.arrow_back_ios,
                        size: 18, color: Colors.grey),
                    onTap: () {
                     
                    },
                  ),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height/35),

              
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE25B5B), // لون أحمر لزر تسجيل الخروج
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'تسجيل الخروج', 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
          // In RTL, items in a Row naturally align with first on right, last on left
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
                textAlign: TextAlign.right, // Explicitly right-align the title text
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