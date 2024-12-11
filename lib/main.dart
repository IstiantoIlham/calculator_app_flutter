import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

AppBar mainAppbar(String title) {
  return AppBar(
    title: Text(title),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();

  num result = 0;

  @override
  void dispose() {
    number1Controller.dispose();
    number2Controller.dispose();
    super.dispose();
  }

  int parseInt(TextEditingController number) {
    return int.parse(number.text);
  }

  void plus() {
    setState(() {
      result = parseInt(number1Controller) + parseInt(number2Controller);
    });
  }

  void min() {
    setState(() {
      result = parseInt(number1Controller) - parseInt(number2Controller);
    });
  }

  void times() {
    setState(() {
      result = parseInt(number1Controller) * parseInt(number2Controller);
    });
  }

  void divided() {
    setState(() {
      result = parseInt(number1Controller) ~/ parseInt(number2Controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar("Calculator App"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: number1Controller,
              decoration: const InputDecoration(
                  hintText: "Please input first number", label: Text("First Number"), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: number2Controller,
              decoration: const InputDecoration(
                  hintText: "Please input your second number",
                  label: Text("Second Number"), border: OutlineInputBorder()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(onPressed: plus, child: const Text("+")),
                  ElevatedButton(onPressed: min, child: const Text("-")),
                  ElevatedButton(onPressed: times, child: const Text("x")),
                  ElevatedButton(onPressed: divided, child: const Text("/")),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    result.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = 0;
                    number1Controller.text = "";
                    number2Controller.text = "";
                  });
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                child: const Text("Reset"))
          ],
        ),
      ),
    );
  }
}
