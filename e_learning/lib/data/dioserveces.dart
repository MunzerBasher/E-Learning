import 'package:dio/dio.dart' as dio;
import 'package:e_learning/domain/functions/checkInternet.dart';
import 'package:get/get.dart';
import 'dart:io';

class ApiService extends GetxService {
  late dio.Dio dioInstance;
  //MyServices myServices = Get.find();

  ApiService() {
    dioInstance = dio.Dio(dio.BaseOptions(
      baseUrl: "http://sanad-service.runasp.net/api/",
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 20),
    ));

    dioInstance.interceptors.add(dio.InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await getToken(); // Get stored token
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        options.headers["Content-Type"] = "application/json";
        return handler.next(options);
      },
      onError: (dio.DioException dioe, handler) async {
        //print(dioe.response?.data);
        if (dioe.response?.statusCode == 400) {
          Get.snackbar(
              "Error", dioe.response!.data['erorr']['message'].toString());
          print(dioe.response!.data['erorr']['message'].toString());
        }
        if (dioe.response?.statusCode == 401) {
          Get.snackbar("Session Expired", "Please log in again.");
        }
        if (dioe.response?.statusCode == 405) {
          Get.snackbar("Error", "405.");
        }
        if (dioe.response?.statusCode == 404) {
          Get.snackbar("Error!", "Not Found.");
        }
        if (dioe.type == dio.DioExceptionType.connectionTimeout) {
          try {
            final response = await dioe.requestOptions.extra["dio"]
                .fetch(dioe.requestOptions);
            return handler.resolve(response);
          } catch (e) {
            return handler.next(dioe);
          }
        }
        return handler.next(dioe);
      },
    ));
  }

  Future<String?> getToken() async {
    return ""; //myServices.sharedPreferences.getString("token");
  }

  Future<dynamic> getRequest(String endpoint, {Object? data}) async {
    try {
      if (!await checkInternet()) {
        Get.snackbar("Error!", "No internet connection");
        return null;
      }
      var response = await dioInstance.get(endpoint, data: data);
      if (response.statusCode! > 204 || response.statusCode! < 200) return null;
      
      return response.data;
    } catch (e) {
     
      return null;
    }
  }

  Future<dynamic> postRequest(String endpoint, dynamic data) async {
    try {
      if (!await checkInternet()) {
        Get.snackbar("Error!", "No internet connection");
        return null;
      }
      var response = await dioInstance.post(endpoint, data: data);
      
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteRequest(String endpoint) async {
    try {
      if (!await checkInternet()) {
        Get.snackbar("Error!", "No internet connection");
        return false;
      }
      var response = await dioInstance.delete(endpoint);
      
      print("response ${response.statusCode}");
      return (response.statusCode! > 204 || response.statusCode! < 200)
          ? false
          : true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateRequest(String endpoint, dynamic data) async {
    try {
      if (!await checkInternet()) {
        Get.snackbar("Error!", "No internet connection");
        return false;
      }
      var response = await dioInstance.put(endpoint, data: data);
      
      return (response.statusCode! > 204 || response.statusCode! < 200)
          ? false
          : true;
    } catch (e) {
      Get.snackbar("Error!", "$e");
      print(e);
      return false;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      String fileName = imageFile.path.split(Platform.pathSeparator).last;
      dio.FormData formData = dio.FormData.fromMap({
        "Image": await dio.MultipartFile.fromFile(imageFile.path,
            filename: fileName),
      });

      var response = await dioInstance.post(
        "Images/Upload-Image",
        data: formData,
        options: dio.Options(
          headers: {"Content-Type": "multipart/form-data"},
        ),
      );
      return response.data.toString();
    } catch (e) {
      return "Error: $e";
    }
  }
}
