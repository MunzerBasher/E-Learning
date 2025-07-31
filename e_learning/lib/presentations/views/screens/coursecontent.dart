import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// class CourseContent extends StatelessWidget {
//   const CourseContent({super.key, required this.courserId});
//   final int courserId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {

//           },
//         ),
//         title: Row(
//           children: [

//             Expanded(child: Container()),
//             const Icon(Icons.cast, color: Colors.white),
//             const SizedBox(width: 16),
//             const Icon(Icons.search, color: Colors.white),
//             const SizedBox(width: 16),
//             const Icon(Icons.more_vert, color: Colors.white),
//           ],
//         ),

//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Container(
//                 color: Colors.black,
//                 // Background color of the video player itself
//                 // child: Image.asset(
//                 //   'assets/video_thumbnail.jpg', // Placeholder for the video thumbnail
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Video Title
//                   const Text(
//                     'MIT 18.03 Differential Equations, Spring 2006',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),

//                   // Channel Info
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 12,
//                         backgroundColor: Colors.transparent,
//                         // child: Image.asset(
//                         //   'assets/mit_logo.png', // Placeholder for MIT logo
//                         //   fit: BoxFit.contain,
//                         // ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text(
//                         'MIT OpenCourseWare',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // Video Stats
//                   const Text(
//                     'Playlist • 33 videos • 1,357,472 views',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 8),

//                   // Description
//                   const Text(
//                     'Differential Equations are the language in which the laws of nature are expressed. Understanding propert...more',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Action Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white24, // Gray background
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                           ),
//                           icon: const Icon(Icons.play_arrow),
//                           label: const Text('Play all'),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.bookmark_border, color: Colors.white), // Save icon
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.share, color: Colors.white),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.download, color: Colors.white),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.arrow_drop_down, color: Colors.white), // More options
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // Video List
//                   _buildVideoListItem(
//                     context,
//                     'Lec 1 | MIT 18.03 Differential Equat...',
//                     'MIT OpenCourseWare',
//                     '1.9M views • 17 years ago',
//                     'assets/lec1_thumbnail.jpg', // Placeholder
//                     '48:56',
//                     true, // Highlighted
//                   ),
//                   _buildVideoListItem(
//                     context,
//                     'Lec 2 | MIT 18.03 Differential Equat...',
//                     'MIT OpenCourseWare',
//                     '355K views • 17 years ago',
//                     'assets/lec2_thumbnail.jpg', // Placeholder
//                     '50:45',
//                   ),
//                   _buildVideoListItem(
//                     context,
//                     'Lec 3 | MIT 18.03 Differential Equat...',
//                     'MIT OpenCourseWare',
//                     'Views and age info...',
//                     'assets/lec3_thumbnail.jpg', // Placeholder
//                     '23:10',
//                   ),

//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   type: BottomNavigationBarType.fixed, // To show all labels
//       //   backgroundColor: Colors.black,
//       //   selectedItemColor: Colors.white,
//       //   unselectedItemColor: Colors.grey,
//       //   currentIndex: 0, // Highlight 'Home'
//       //   onTap: (index) {
//       //     // Handle navigation
//       //   },
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.whatshot), // Or another icon for Shorts
//       //       label: 'Shorts',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.add_circle_outline, size: 30), // Plus icon
//       //       label: '', // No label for the add button
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.subscriptions),
//       //       label: 'Subscriptions',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.video_library),
//       //       label: 'Library',
//       //     ),
//       //   ],
//       // ),
//     );
//   }

//   Widget _buildVideoListItem(
//     BuildContext context,
//     String title,
//     String channel,
//     String stats,
//     String thumbnailUrl,
//     String duration, [
//     bool isHighlighted = false,
//   ]) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(
//                   thumbnailUrl,
//                   width: 160, // Adjust width as needed
//                   height: 90, // Adjust height as needed
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     width: 160,
//                     height: 90,
//                     color: Colors.grey,
//                     child: const Icon(Icons.broken_image, color: Colors.white),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 4,
//                 right: 4,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.black87,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     duration,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: isHighlighted ? Colors.blue : Colors.white, // Highlight if first video
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   channel,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 13,
//                   ),
//                 ),
//                 Text(
//                   stats,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.more_vert, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CourseContent extends StatelessWidget {
  const CourseContent({super.key, required this.courserId});
  final int courserId;
  final List<Map<String, String>> materials = const [
    {
      "name": "الأحياء",
      "topic": "النظام البيئي",
      "description": "مادة الأحياء لطلاب الصف الثالث الشهادة السودانية",
      "url":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", // مثال على رابط فيديو
      "time": "00:13:20"
    },
    // {
    //   "name": "الرياضيات",
    //   "topic": "النهايات",
    //   "description":
    //       "النهايات هي أحد المفاهيم الأساسية في حساب التفاضل والتكامل",
    //   "url":
    //       "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", // مثال آخر
    //   "time": "0:55:24"
    // },
    // {
    //   "name": "التربيةالإسلامية",
    //   "topic": "التجويد-المدود",
    //   "description":
    //       "مادة التربية الإسلامية لطلاب الصف الثالث الشهادة السودانية ",
    //   "url":
    //       "https://flutter.github.io/assets-for-api-docs/assets/videos/penguin.mp4", // مثال آخر
    //   "time": "00:12:37"
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المواد التعليمية'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: materials.length,
        itemBuilder: (context, index) {
          final material = materials[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    material["name"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الموضوع: ${material["topic"]!}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    material["description"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'المدة: ${material["time"]!}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                videoUrl: material["url"]!,
                                title: material["name"]!,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('مشاهدة'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// صفحة جديدة لتشغيل الفيديو
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      // يمكنك إضافة المزيد من الخيارات هنا (مثل التحكم في مستوى الصوت، السرعة، إلخ.)
    );
    setState(() {}); // لتحديث الواجهة بعد تهيئة المشغل
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const Center(
              child:
                  CircularProgressIndicator(), // عرض مؤشر تحميل أثناء تهيئة الفيديو
            ),
    );
  }
}
