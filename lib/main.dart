import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int difference = 0;
  int product = 0;
  int quotient = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();
  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  void calculateSum() {
    int firstAddNum = int.tryParse(add1Controller.text) ?? 0;
    int secondAddNum = int.tryParse(add2Controller.text) ?? 0;
    setState(() {
      sum = firstAddNum + secondAddNum;
    });
  }

  void calculateDifference() {
    int firstSubNum = int.tryParse(sub1Controller.text) ?? 0;
    int secondSubNum = int.tryParse(sub2Controller.text) ?? 0;
    setState(() {
      difference = firstSubNum - secondSubNum;
    });
  }

  void calculateProduct() {
    int firstMulNum = int.tryParse(mul1Controller.text) ?? 0;
    int secondMulNum = int.tryParse(mul2Controller.text) ?? 0;
    setState(() {
      product = firstMulNum * secondMulNum;
    });
  }

  void calculateQuotient() {
    int firstDivNum = int.tryParse(div1Controller.text) ?? 0;
    int secondDivNum = int.tryParse(div2Controller.text) ?? 0;
    setState(() {
      quotient = secondDivNum != 0
          ? (firstDivNum ~/ secondDivNum)
          : 0; // Integer division
    });
  }

  void clearSum() {
    add1Controller.clear();
    add2Controller.clear();
    setState(() {
      sum = 0;
    });
  }

  void clearDifference() {
    sub1Controller.clear();
    sub2Controller.clear();
    setState(() {
      difference = 0;
    });
  }

  void clearProduct() {
    mul1Controller.clear();
    mul2Controller.clear();
    setState(() {
      product = 0;
    });
  }

  void clearQuotient() {
    div1Controller.clear();
    div2Controller.clear();
    setState(() {
      quotient = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Addition", style: TextStyle(fontSize: 20)),
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),

              Text(' = $sum'),
              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: calculateSum,
              ),
              // b.b Add an button here
              TextButton(
                onPressed: clearSum,
                child: const Text('Clear'),
              ),
            ],
          ),

          // 3.c - Add the other operations
          // Minus Row
          const Text("Subtraction", style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),

              Text(' = $difference'),
              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: calculateDifference,
              ),
              // b.b Add an button here
              TextButton(
                onPressed: clearDifference,
                child: const Text('Clear'),
              ),
            ],
          ),

          const Text("Multiplication", style: TextStyle(fontSize: 20)),
          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mul1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" × "),
              Expanded(
                child: TextField(
                  controller: mul2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),

              Text(' = $product'),
              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: calculateProduct,
              ),
              // b.b Add an button here
              TextButton(
                onPressed: clearProduct,
                child: const Text('Clear'),
              ),
            ],
          ),

          const Text("Division", style: TextStyle(fontSize: 20)),
          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: div2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                ),
              ),

              Text(' = $quotient'),
              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(Icons.calculate),
                onPressed: calculateQuotient,
              ),
              // b.b Add an button here
              TextButton(
                onPressed: clearQuotient,
                child: const Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
