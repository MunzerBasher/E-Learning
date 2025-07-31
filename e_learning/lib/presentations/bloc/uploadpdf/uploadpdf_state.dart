import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class PdfPickerState extends Equatable {
  const PdfPickerState();

  @override
  List<Object> get props => [];
}

class PdfPickerInitial extends PdfPickerState {}

class PdfPickerLoading extends PdfPickerState {}

class PdfFilePicked extends PdfPickerState {
  final String fileName;
  final File file;

  const PdfFilePicked({required this.fileName, required this.file});

  @override
  List<Object> get props => [fileName, file];
}

class PdfPickerError extends PdfPickerState {
  final String message;

  const PdfPickerError({required this.message});

  @override
  List<Object> get props => [message];
}