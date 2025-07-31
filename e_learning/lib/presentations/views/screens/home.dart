import 'package:e_learning/presentations/bloc/Notebooks/notebooks_bloc.dart';
import 'package:e_learning/presentations/bloc/home/home_bloc.dart';
import 'package:e_learning/presentations/bloc/suggestedexams/suggestedexams_bloc.dart';
import 'package:e_learning/presentations/views/screens/sanadcourses.dart';
import 'package:e_learning/presentations/views/screens/sanadliveapp.dart';
import 'package:e_learning/presentations/views/screens/sanadnotebooksapp.dart';
import 'package:e_learning/presentations/views/screens/sanadprofile.dart';
import 'package:e_learning/presentations/views/screens/trainingscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SuggestedexamsBloc()..add(SuggestedexamsLoading()),
        ),
        BlocProvider(create: (context) => HomeBloc()..add(LoadData())),
        BlocProvider(
            create: (_) => NotebooksBloc()..add(NotebooksLoadingEvent())),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "المحاضرات المباشرة",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLivesLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is HomeLivesLoaded) {
                      var lives = state.lives;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lives.length,
                            itemBuilder: (_, index) {
                              var live = lives[index];
                              return _buildLiveNowCard(
                                live.imagePath,
                                live.name,
                                live.major,
                                live.course,
                                const Color(0xFFD4E7D6),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: Text(""),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'اختبارات مقترحة',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),
                BlocBuilder<SuggestedexamsBloc, SuggestedexamsState>(
                  builder: (context, state) {
                    if (state is SuggestedexamLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is SuggestedexamLoaded) {
                      var exams = state.list;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: exams.length,
                            itemBuilder: (_, index) {
                              var exam = exams[index];
                              return _buildExamCard(exam.title, exam.schedule,
                                  exam.cardBackgroundColor);
                            }),
                      );
                    }
                    return const Center(
                      child: Text(""),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'عرض الكل', // ترجمة
                        style: TextStyle(
                          color: Color(0xFF4A34AF),
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
                SizedBox(height: MediaQuery.of(context).size.height / 15),
                BlocBuilder<NotebooksBloc, NotebooksState>(
                  builder: (context, state) {
                    if (state is NotebooksLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is NotebooksLoaded) {
                      var lives = state.notebooks;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lives.length,
                            itemBuilder: (_, index) {
                              var live = lives[index];
                              return _buildNotebookCard(
                                live.course,
                                live.name,
                                const Color(0xFFD4E7D6),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: Text(""),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildLiveNowCard(String imagePath, String name, String subject,
      String topic, Color bgColor,
      {bool isJoonCard = false}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
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
        crossAxisAlignment:
            CrossAxisAlignment.start, // ستبقى 'start' في سياق RTL تعني اليمين
        children: [
          Row(
            children: [

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
                child: Center(
                  child: Text(
                    "${name.substring(0,1)} ${name.split(" ")[1].substring(0,1)}"
                    ,
                    style: const  TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
             
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // ستبقى 'start' في سياق RTL تعني اليمين
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Align(
            alignment: Alignment
                .bottomLeft, // تغيير المحاذاة لـ RTL (الزر سيكون على اليسار)
            child: ElevatedButton(
              onPressed: () {
                print(
                    'تم النقر على زر ${isJoonCard ? 'جون' : 'انضمام'} للمستخدم $name'); // ترجمة رسالة الطباعة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isJoonCard
                    ? const Color(0xFFD3B765)
                    : const Color(0xFFCCAA80), // لون زر "Joon" مختلف
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 150),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 25,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SanadLiveScreen())),
                        child: const Text(
                          'انضمام', // ترجمة
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (isJoonCard) const SizedBox(width: 8),
                      if (isJoonCard)
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.white,
                          size: 16,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamCard(String title, String subtitle, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.5,
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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 50),
                        const Text("15 يونيو")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.question_answer,
                          size: 15,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 50),
                        const Text("الاسئلة 12 ")
                      ],
                    ),
                  ],
                )
              ],
            ),

            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 150),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Padding(
              //backgroundColor: const Color(0xFF3B5E3C),
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: const BoxDecoration(
                    color: Color(0xFF3B5E3C),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: const Center(
                  child: Text(
                    'ابدأ', // ترجمة
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // زر "ابدأ" (يكون على اليسار في RTL)
          ],
        ),
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
        ],
      ),
    );
  }

  Widget _buildNotebookCard(String title, String author, Color bgColor) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 5),
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
        crossAxisAlignment:
            CrossAxisAlignment.center, // ستبقى 'start' في سياق RTL تعني اليمين
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          //SizedBox(height:  MediaQuery.of(context).size.height/25),
          Center(
            child: Text(
              author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                print('تم النقر على زر ابدأ لمذكرة $title');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B5E3C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: const Center(
                  child: Text(
                    'ابدأ', // ترجمة
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
        color: const Color(0xFF3B5E3C),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            label: "الرئسية", // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrainingScreen())),
                icon: const Icon(Icons.school)), // أو أيقونة تدريب مناسبة
            label: 'التدريب', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SanadCoursesApp())),
                icon: const Icon(
                    Icons.menu_book)), // أيقونة 'Learn' في الصورة تبدو كدفتر
            label: 'تعلم', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotebooksScreen())),
                icon: const Icon(Icons.book)), // أو أيقونة Notebooks مناسبة
            label: 'المفكرات', // ترجمة
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen())),
                icon: const Icon(Icons.person)),
            label: 'الملف الشخصي', // ترجمة
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
        icon:
            const Icon(FontAwesomeIcons.bars, color: Colors.black54, size: 22),
        onPressed: () {},
      ),
    );
  }
}

class CustomLog extends StatelessWidget {
  const CustomLog({super.key, this.text});
  final bool? text;

  Widget _buildCustomAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //CustomMenuBar(),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (text != null && text == true)
                ? const Text(
                    'سند', // ترجمة
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                : const Text(""),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFF3B5E3C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_book,
                  color: Colors.white, size: 20), // أيقونة مؤقتة للشعار
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCustomAppBar(context);
  }
}
