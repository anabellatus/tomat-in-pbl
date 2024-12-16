import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tomatin/modules/controllers/user_controller.dart';
import 'package:tomatin/data/repositories/user_repository.dart';
import 'package:tomatin/routes/app_routes.dart';

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => UserController(UserRepository()));
  await GetStorage.init();

  final box = GetStorage();
  final token = box.read('token');

  runApp(
    GetMaterialApp(
      initialRoute: token != null ? '/home' : '/login',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
    ),
  );
}
