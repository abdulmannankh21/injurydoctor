import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../Signin/login_Controller.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }
}