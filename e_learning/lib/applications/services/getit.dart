import 'package:e_learning/data/dioserveces.dart';
import 'package:e_learning/data/quizrepo.dart';
import 'package:get_it/get_it.dart';

class GetItServices {
  static  GetIt getIt = GetIt.instance;

  static void setupLocator() {
    getIt.registerSingleton<ApiService>(ApiService());
    getIt.registerSingleton<Quizrepo>(Quizrepo(api: getIt<ApiService>()));
 
  }


}
