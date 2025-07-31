import 'package:e_learning/presentations/bloc/training/training_bloc.dart';
import 'package:e_learning/presentations/views/screens/spicaliztion.dart';
import 'package:e_learning/presentations/views/screens/home.dart';
import 'package:e_learning/presentations/views/screens/uploadfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrainingBloc()..add(LoadingTraining()),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomLog(text: false),
                  
                  const Text(
                    'التدريب',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_forward,
                          color: Colors.black87)),
                ],
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Expanded(
              child: BlocBuilder<TrainingBloc, TrainingState>(
                builder: (context, state) {
                  if (state is TrainingLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is TrainingLoaded) {
                    return Expanded(
                      child: ListView(
                        children: [
                          QuizCard(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Spicaliztion())),
                            icon: Icons.smart_toy_outlined,
                            title: 'اختبار بالذكاء الاصطناعي',
                            description: 'تدريب شخصي مدعوم بالذكاء الاصطناعي',
                            iconBgColor: const Color(0xFFECECEC),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 25),
                          QuizCard(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Spicaliztion())),
                            icon: Icons.edit_outlined,
                            title: 'اختباراتنا',
                            description: 'اختبارات منسقة بواسطة مدربي سند',
                            iconBgColor: const Color(0xFFECECEC),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 25),
                          QuizCard(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UploadPdfPage())),
                            icon: Icons.smart_toy_rounded,
                            title: '  اختبار من ملف pdf اختياري',
                            description: 'تدريب شخصي مدعوم بالذكاء الاصطناعي',
                            iconBgColor: const Color(0xFFECECEC),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ));
  }
}

class QuizCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconBgColor;
  final VoidCallback onTap;

  const QuizCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconBgColor,
                radius: 24,
                child: Icon(icon, color: Colors.black),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
