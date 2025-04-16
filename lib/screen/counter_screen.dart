import 'package:counterapp/controller/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterController _controller = CounterController();

  @override
  void initState() {
    super.initState();
    _controller.loadCounter().then((_) => setState(() {}));
  }

  void _updateCounter(int value) {
    setState(() {
      _controller.counter += value;
    });
    _controller.saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter Count", style: TextStyle(fontSize: 20)),
            Text(
              '${_controller.counter}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _updateCounter(-1),
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () => _updateCounter(1),
                    child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
