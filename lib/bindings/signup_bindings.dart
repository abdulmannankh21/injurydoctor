import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../SignUp/signup_controller.dart';



class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
          () => SignupController(),
    );
  }
}