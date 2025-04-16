import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPrefrence extends StatefulWidget {
  const CounterPrefrence({super.key});

  @override
  State<CounterPrefrence> createState() => _CounterPrefrenceState();
}

class _CounterPrefrenceState extends State<CounterPrefrence> {
  int _Counter = 0;

  @override
  void initState() {
    super.initState();
    _loaderCounter();
  }

  _loaderCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _Counter = pref.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _Counter++;
      pref.setInt('Counter', _Counter);
    });
  }

  _decrementCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _Counter--;
      pref.setInt('Counter', _Counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Count",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$_Counter',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
