import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';


class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
 
  WelcomeBloc() : super(WelcomeInitial()) {
    
    on<StudentLoginPressed>(_onStudentLoginPressed);
    on<TeacherLoginPressed>(_onTeacherLoginPressed); 
    on<GoogleSignInPressed>(_onGoogleSignInPressed);
  }

 
  Future<void> _onStudentLoginPressed(
      StudentLoginPressed event, Emitter<WelcomeState> emit) async {
    emit(const WelcomeLoading('جاري تسجيل الدخول كطالب...')); 
    debugPrint('Student login button pressed!');
    await Future.delayed(const Duration(seconds: 1));

    try {
      emit(const WelcomeSuccess('طالب'));
      debugPrint('Student login successful!');
      
    } catch (e) {
      emit(WelcomeError('فشل تسجيل الدخول كطالب: $e')); 
      debugPrint('Student login failed: $e');
    }
  }

  
  Future<void> _onTeacherLoginPressed(
      TeacherLoginPressed event, Emitter<WelcomeState> emit) async { // Use the renamed event
    emit(const WelcomeLoading('جاري تسجيل الدخول كمعلم...')); // Emit loading state
    debugPrint('Teacher login button pressed!'); // Log the event

    
    await Future.delayed(const Duration(seconds: 1));

    try {
      // In a real app, this would involve actual authentication logic with your server
      // Example: final response = await http.post(Uri.p
      // If successful, emit WelcomeSuccessarse('YOUR_SERVER_LOGIN_ENDPOINT'), body: {'username': '...', 'password': '...'});
      emit(const WelcomeSuccess('معلم'));
      debugPrint('Teacher login successful!');
      // TODO: Navigate to teacher dashboard or handle session
    } catch (e) {
      emit(WelcomeError('فشل تسجيل الدخول كمعلم: $e')); // Emit error state
      debugPrint('Teacher login failed: $e');
    }
  }

  // Event handler for GoogleSignInPressed
  Future<void> _onGoogleSignInPressed(
      GoogleSignInPressed event, Emitter<WelcomeState> emit) async {
    emit(const WelcomeLoading('جاري المتابعة باستخدام جوجل...')); // Emit loading state
    debugPrint('Google sign-in button pressed!'); // Log the event

    await Future.delayed(const Duration(seconds: 1));


    try {
      // Trigger the Google Sign-In flow. This will show the account picker.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If the user cancels the sign-in process
      if (googleUser == null) {
        emit(const WelcomeError('تم إلغاء تسجيل الدخول بحساب جوجل.'));
        debugPrint('Google sign-in cancelled by user.');
        return;
      }

      // Retrieve the authentication details from the Google account.
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Extract the ID Token and Access Token
      final String? idToken = googleAuth.idToken;
      final String? accessToken = googleAuth.accessToken;

      if (idToken == null) {
        emit(const WelcomeError('فشل الحصول على ID Token من جوجل.'));
        debugPrint('Google Sign-In failed: ID Token is null.');
        return;
      }

      print('Google ID Token: $idToken');
      print('Google Access Token: $accessToken');
      print('Google User Display Name: ${googleUser.displayName}');
      print('Google User Email: ${googleUser.email}');

      // --- Send ID Token to your custom backend server for verification ---
      // In a real application, you would make an HTTP POST request to your server here.
      // Your server would then verify the ID Token with Google and create/retrieve a user session.
      // Example using http package (uncomment 'package:http/http.dart' as http;'):
      /*
      final response = await http.post(
        Uri.parse('YOUR_BACKEND_AUTH_ENDPOINT/google-signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idToken': idToken,
          'accessToken': accessToken, // Optional, depending on your backend needs
          'email': googleUser.email,
          'displayName': googleUser.displayName,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming your backend returns user data or a success message
        // final responseData = json.decode(response.body);
        emit(WelcomeSuccess('جوجل', userName: googleUser.displayName));
        debugPrint('Google sign-in successful with custom backend for user: ${googleUser.displayName}');
        // TODO: Navigate to appropriate dashboard after successful custom backend login
      } else {
        emit(WelcomeError('فشل تسجيل الدخول بحساب جوجل مع الخادم: ${response.statusCode}'));
        debugPrint('Google sign-in failed with custom backend: ${response.body}');
      }
      */

      // For demonstration, simulate a successful backend call after a delay
      await Future.delayed(const Duration(seconds: 1));
      emit(WelcomeSuccess(googleUser.displayName!));
      debugPrint('Google sign-in successful (simulated backend call) for user: ${googleUser.displayName}');

    } catch (e) {
      // Handle any errors during the Google Sign-In process or backend communication
      emit(WelcomeError('فشل المتابعة باستخدام جوجل: ${e.toString()}'));
      debugPrint('Google sign-in failed: $e');
    }
  }
}
