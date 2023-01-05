import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorExample(),
    );
  }
}

class CalculatorExample extends StatefulWidget {
  const CalculatorExample({super.key});

  @override
  State<CalculatorExample> createState() => _CalculatorExampleState();
}

class _CalculatorExampleState extends State<CalculatorExample> {
  int? num1;
  int? num2;
  int? sum;

  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  void add() {
    num1 = int.parse(n1.text);
    num2 = int.parse(n2.text);
    setState(() {
      sum = (num1! + num2!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: 5, right: 20),
              child: TextField(
                controller: n1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
              ),
            ),
            const Text(
              "+",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                textInputAction: TextInputAction.next,
                controller: n2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: add,
              child: const Text(
                "add",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Text("Результат: ${sum ?? 0}")
          ],
        ),
      ),
    );
  }
}
