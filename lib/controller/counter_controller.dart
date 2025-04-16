import 'package:counterapp/services/counter_stoarge.dart';

class CounterController {
  int counter = 0;

  Future<void> loadCounter() async {
    counter = await CounterStorage.load();
  }

  Future<void> saveCounter() async {
    await CounterStorage.save(counter);
  }
}
