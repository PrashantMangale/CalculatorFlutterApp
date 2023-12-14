import 'package:calculator_app/controllers/operations_controller.dart';
import 'package:get/get.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OperationsController());
  }
}