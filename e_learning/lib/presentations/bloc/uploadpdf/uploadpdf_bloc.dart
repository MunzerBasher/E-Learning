import 'package:e_learning/presentations/bloc/uploadpdf/uploadpdf_event.dart';
import 'package:e_learning/presentations/bloc/uploadpdf/uploadpdf_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';




class PdfPickerBloc extends Bloc<PdfPickerEvent, PdfPickerState> {
  PdfPickerBloc() : super(PdfPickerInitial()) {
    on<PickPdfFile>(_onPickPdfFile);
    on<ClearPdfFile>(_onClearPdfFile);
  }

  Future<void> _onPickPdfFile(
      PickPdfFile event, Emitter<PdfPickerState> emit) async {
    emit(PdfPickerLoading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        final File selectedFile = File(result.files.single.path!);
        final String fileName = result.files.single.name;
        emit(PdfFilePicked(fileName: fileName, file: selectedFile));
      } else {
        emit(const PdfPickerError(message: 'تم إلغاء اختيار الملف.'));
        emit(PdfPickerInitial()); // العودة للحالة الأولية بعد الإلغاء
      }
    } catch (e) {
      emit(PdfPickerError(message: 'حدث خطأ أثناء اختيار الملف: $e'));
      emit(PdfPickerInitial()); // العودة للحالة الأولية بعد الخطأ
    }
  }

  void _onClearPdfFile(ClearPdfFile event, Emitter<PdfPickerState> emit) {
    emit(PdfPickerInitial());
  }
}