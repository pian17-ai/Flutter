import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  // runApp(const CalculatorApp());
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const CalculatorApp(),
    )
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: "calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator()
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = "";
  String _output = "";

  void _handleButtonPress(String value) {
    setState(() {
      if (value == "C") {
        _input = "";
        _output = "";
      } else if (value == "=") {
        _calculateState();
      } else if (value == "<=") {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length -1);
        }
      } else {
        _input += value;
      }
    });
  }

  void _calculateState() {
    try {
      Parser parser=Parser();
      Expression expression = parser.parse(_input);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      _output = eval.toString();
    } catch (e) {
      _output = "Error";
    }
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _handleButtonPress(text),
        child: Text(
          text, 
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _input, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _output, style: TextStyle(fontSize: 32),
            ),
          ),
          Divider(),
            Row(children: <Widget> [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('4'),
            ],
            ),
            Row(children: <Widget> [
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('7'),
              _buildButton('8'),
            ],
            ),
            Row(children: <Widget> [
              _buildButton('9'),
              _buildButton('0'),
              _buildButton('+'),
              _buildButton('*'),
            ],
            ),
            Row(children: <Widget> [
              _buildButton('j'),
              _buildButton('i'),
              _buildButton('h'),
              _buildButton('%'),
            ],
            ),
            Row(children: <Widget> [
              _buildButton('='),
              _buildButton('C'),
              _buildButton('<='),
            ],
            ),
        ],
      ),
    );
  }
}