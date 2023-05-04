import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/HomeScreen.dart';
import 'package:injurydoctor/Screens/SelectWeight.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/Screens/WhatHurtingScreen.dart';

import '../Screens/Gender.dart';
import '../Screens/SelectAge.dart';
import '../Screens/SelectHeight.dart';
import '../Screens/Surve Screens/SurveScreen1.dart';
import '../Screens/Surve Screens/SurveScreen2.dart';
import '../Screens/Surve Screens/SurveScreen3.dart';
import '../Screens/Surve Screens/SurveScreen4.dart';
import '../Screens/Surve Screens/SurveScreen5.dart';

class AgeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgeController>(
          () => AgeController(),
    );
  }
}
class WeightBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectWeightController>(
          () => SelectWeightController(),
    );
  }
}
class HeightBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectHeightController>(
          () => SelectHeightController(),
    );
  }
}
class GenderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderController>(
          () => GenderController(),
    );
  }
}
class HurtingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsHurtingController>(
          () => WhatsHurtingController(),
    );
  }
}
class Servey1Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveScreen1Controller>(
          () => SurveScreen1Controller(),
    );
  }
}
class Servey2Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveScreen2Controller>(
          () => SurveScreen2Controller(),
    );
  }
}
class Servey3Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveScreen3Controller>(
          () => SurveScreen3Controller(),
    );
  }
}
class Servey4Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveScreen4Controller>(
          () => SurveScreen4Controller(),
    );
  }
}
class Servey5Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveScreen5Controller>(
          () => SurveScreen5Controller(),
    );
  }
}
class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
// class AlarmBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<AlarmController>(
//           () => AlarmController(),
//     );
//   }
// }
class TodayBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayController>(
          () => TodayController(),
    );
  }
}

