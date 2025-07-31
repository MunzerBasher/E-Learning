import 'package:equatable/equatable.dart';

abstract class PdfPickerEvent extends Equatable {
  const PdfPickerEvent();

  @override
  List<Object> get props => [];
}

class PickPdfFile extends PdfPickerEvent {}

class ClearPdfFile extends PdfPickerEvent {}