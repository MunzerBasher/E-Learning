import 'package:e_learning/presentations/bloc/Welcome/welcome_bloc.dart';
import 'package:e_learning/presentations/views/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _showMessageDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('موافق'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state is WelcomeLoading) {
            _showMessageDialog(context, 'جاري التحميل', state.message);
          } else if (state is WelcomeSuccess) {
            _showMessageDialog(context, 'نجاح!',
                'تم تسجيل الدخول كـ ${state.userType} بنجاح.');
          } else if (state is WelcomeError) {
            _showMessageDialog(context, 'خطأ', state.message);
          }
        },
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            final bool isLoading = state is WelcomeLoading;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Icon(Icons.menu_book_rounded,
                    //     size: 72, color: Color(0xFF0E4429)),
                    Image.asset(
                      'images/LogoApplecation.jpg', // هذا هو المسار الصحيح
                      
                      fit: BoxFit.contain, // يمكنك تحديد كيفية احتواء الصورة
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'مرحبًا بك في سند',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E4429),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    const Text(
                      'طريقك إلى النجاح في\nامتحانات الشهادة الثانوية السودانية', // Translated: 'Your path to success in Sudanese high school exams'
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null // Disable button if loading
                                : () {
                                    // Dispatch StudentLoginPressed event to the BLoC
                                    context
                                        .read<WelcomeBloc>()
                                        .add(StudentLoginPressed());
                                  },
                            child: const Text('طالب'),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 20),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    context
                                        .read<WelcomeBloc>()
                                        .add(TeacherLoginPressed());
                                  },
                            child: const Text('معلم'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    OutlinedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () {
                              context
                                  .read<WelcomeBloc>()
                                  .add(GoogleSignInPressed());
                            },
                      icon: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                        height: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.g_mobiledata,
                              size: 24, color: Color(0xFF0E4429));
                        },
                      ),
                      label: const Text(
                        'المتابعة باستخدام جوجل',
                        style: TextStyle(color: Color(0xFF0E4429)),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: const BorderSide(color: Color(0xFF0E4429)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    const Text(
                      "سنستخدم حسابك في جوجل لتخصيص\nتجربتك",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    const Text.rich(
                      TextSpan(
                        text: 'باستمرارك، فإنك توافق على\n',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                        children: [
                          TextSpan(
                            text: 'شروط الاستخدام',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          TextSpan(text: ' و '),
                          TextSpan(
                            text: 'سياسة الخصوصية',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    if (isLoading) ...[
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Text(
                        (state).message,
                        style: const TextStyle(
                            color: Color(0xFF0E4429),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      const CircularProgressIndicator(color: Color(0xFF0E4429)),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
