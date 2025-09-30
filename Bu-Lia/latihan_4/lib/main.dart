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
      title: "Navigation",
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 89, 228, 25),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        title: const Text("First Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/nahihiw.jpg', width: 250, height: 250),

            SizedBox(height: 20),

            Image.asset('assets/img/nahihw.jpg', width: 250, height: 250),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text("Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            MyForm(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();

  String _nama = "";
  String _kelas = "";
  int _umur = 0;

  void _submitData() {
    setState(() {
      _nama = _namaController.text;
      _kelas = _kelasController.text;
      _umur = int.tryParse(_umurController.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _namaController,
            decoration: InputDecoration(
              labelText: "Masukkan nama",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _kelasController,
            decoration: InputDecoration(
              labelText: "Masukkan kelas",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _umurController,
            decoration: InputDecoration(
              labelText: "Masukkan umur",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(onPressed: _submitData, child: Text("Submit")),

          SizedBox(height: 20),

          Text(
            _nama.isEmpty ? '' : 'Nama:$_nama',
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 20),

          Text(
            _kelas.isEmpty ? '' : 'Kelas:$_kelas',
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 20),

          Text(_umur < 1 ? '' : 'Umur:$_umur', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
