import 'package:e_learning/presentations/views/screens/home.dart';
import 'package:flutter/material.dart';



class NotebooksScreen extends StatelessWidget {
  const NotebooksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفكرات'), // Translated: 'Notebooks'
        centerTitle: true,
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Remains start for RTL to align to right
            children: [
              const CustomLog(),
              const Text(
                'المفكرات', 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/35),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotebookCard1(context),
                    SizedBox(height: MediaQuery.of(context).size.height/35),
                    _buildNotebookCard2(context),
                    SizedBox(height: MediaQuery.of(context).size.height/35),
                    // You can add more cards here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 4, 38, 66),
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.add_circle, size: 40,color: Colors.white,)
                  )),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.centerDocked,

    );
  }

  Widget _buildNotebookCard1(BuildContext context) {
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
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFE2E0EE), // Image background color
              borderRadius: BorderRadius.circular(15),
              // You can use Image.asset or Image.network here for the image
              // For example:
              // image: DecorationImage(
              //   image: AssetImage('assets/notebook_image1.png'), // Replace with image path
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Center(
              child: Image.asset(
                'assets/notebook_image1.png', // Replace with actual image path
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, size: 50, color: Colors.grey); // Placeholder
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Remains start for RTL to align to right
              children: [
                const Text(
                  "ملخصات الكيمياء", // Transliteration: 'Sinetion Burgiver'
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/35),
                // const Text(
                //   '#FAF3E0', // Color code
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: Color(0xFFFAF3E0),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // const Text(
                //   'أوتيلفر', // Transliteration: 'Outelver'
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.black54,
                //   ),
                // ),
                // const Text(
                //   'كسنر فوتبيون', // Transliteration: 'Csner Foutpion'
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.black54,
                //   ),
                // ),
                // const Text(
                //   'ميكس', // Transliteration: 'Mex'
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.black54,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotebookCard2(BuildContext context) {
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
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF23194B), // Dark background color
              borderRadius: BorderRadius.circular(15),
              // You can use Image.asset or Image.network here for the image
              // For example:
              // image: DecorationImage(
              //   image: AssetImage('assets/notebook_image2.png'), // Replace with image path
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Center(
              child: Image.asset(
                'assets/notebook_image2.png', // Replace with actual image path
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.book, size: 50, color: Colors.white70); // Placeholder
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Remains start for RTL to align to right
              children: [
                const Text(
                  "ملخصات الفيزياء", // Transliteration: 'Mutu Stoks'
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.description, '2xl'),
                _buildInfoRow(Icons.favorite_border, 'أنسير'), // Transliteration: 'Uncier'
                _buildInfoRow(Icons.check_circle_outline, 'مِست', trailingWidget: _buildOxtTag()), // Transliteration: 'Mest'
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {Widget? trailingWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          if (trailingWidget != null) trailingWidget,
        ],
      ),
    );
  }

  Widget _buildOxtTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF9C27B0).withOpacity(0.1), // Light purple color
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'أوكس تي', // Transliteration: 'Oxt'
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9C27B0), // Purple color
        ),
      ),
    );
  }
}