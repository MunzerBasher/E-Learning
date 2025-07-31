import 'package:e_learning/presentations/bloc/uploadpdf/uploadpdf_bloc.dart';
import 'package:e_learning/presentations/bloc/uploadpdf/uploadpdf_event.dart';
import 'package:e_learning/presentations/bloc/uploadpdf/uploadpdf_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadPdfPage extends StatelessWidget {
  const UploadPdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => PdfPickerBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('رفع ملف PDF'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // استخدام LayoutBuilder لجعل الحجم متجاوبًا
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // تحديد عرض المربع بناءً على عرض الشاشة، بحد أقصى 400
                    final containerWidth = constraints.maxWidth > 400
                        ? 400.0
                        : constraints.maxWidth * 0.9;
                    // تحديد ارتفاع المربع باستخدام نسبة إلى العرض ليكون متجاوبًا
                    final containerHeight =
                        containerWidth * 0.4; // نسبة 40% من العرض

                    return GestureDetector(
                      onTap: () {
                        context.read<PdfPickerBloc>().add(PickPdfFile());
                      },
                      child: Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child: BlocConsumer<PdfPickerBloc, PdfPickerState>(
                          listener: (context, state) {
                            if (state is PdfPickerError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            } else if (state is PdfFilePicked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'تم اختيار الملف: ${state.fileName}')),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is PdfPickerLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is PdfFilePicked) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    size: containerHeight *
                                        0.3, // حجم الأيقونة متجاوب
                                    color: Colors.red[700],
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      state.fileName,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: containerHeight *
                                            0.12, // حجم الخط متجاوب
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'تم الاختيار بنجاح',
                                    style: TextStyle(
                                      fontSize: containerHeight *
                                          0.1, // حجم الخط متجاوب
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              );
                            }
                            // Initial أو Error
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  size: containerHeight *
                                      0.3, // حجم الأيقونة متجاوب
                                  color: Colors.blue[600],
                                ),
                                const SizedBox(height: 10),
                                Flexible(
                                  child: Text(
                                    'اضغط لرفع ملف PDF',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: containerHeight *
                                          0.12, // حجم الخط متجاوب
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocBuilder<PdfPickerBloc, PdfPickerState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: state is PdfFilePicked
                          ? () {
                              // هنا يمكنك إضافة منطق معالجة الملف بعد اختياره
                              // مثلاً: print('جاري معالجة الملف: ${state.file.path}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'جاري معالجة الملف: ${state.fileName}')),
                              );
                              // يمكنك إرسال حدث لمعالجة الملف، مثلاً:
                              // context.read<PdfPickerBloc>().add(ProcessPdfFile(state.file));
                            }
                          : null, // تعطيل الزر إذا لم يتم اختيار ملف
                      icon: const Icon(Icons.send),
                      label: const Text('معالجة الملف المختار'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08, // Padding متجاوب
                          vertical: screenHeight * 0.02, // Padding متجاوب
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                // زر لمسح الاختيار
                BlocBuilder<PdfPickerBloc, PdfPickerState>(
                  builder: (context, state) {
                    if (state is PdfFilePicked) {
                      return TextButton.icon(
                        onPressed: () {
                          context.read<PdfPickerBloc>().add(ClearPdfFile());
                        },
                        icon: const Icon(Icons.clear, color: Colors.red),
                        label: const Text('مسح الاختيار',
                            style: TextStyle(color: Colors.red)),
                      );
                    }
                    return const SizedBox
                        .shrink(); // لا يظهر الزر إلا عند وجود ملف مختار
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
