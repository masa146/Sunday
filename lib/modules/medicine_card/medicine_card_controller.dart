import 'package:get/get.dart';

class MedicineCardController extends GetxController {
  RxInt quantity;
  MedicineCardController(this.quantity);

  var isFavorited = false.obs;
  var counter = 0.obs;

  void toggleFavorite() {
    isFavorited.value = !isFavorited.value;
  }

  void incrementCounter() {
    if (counter.value < quantity.value) counter.value++;
  }

  void decrementCounter() {
    if (counter.value > 0) counter.value--;
  }
}
