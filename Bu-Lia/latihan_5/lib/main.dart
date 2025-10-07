import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    DevicePreview(
      enabled: true, // aktifkan device preview
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: "Naspad padang wenak",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/lauk': (context) =>
            const LaukPage(menuTitle: 'Lauk', icon: Icons.egg),
        '/minum': (context) =>
            const DrinkPage(menuTitle: 'Minum', icon: Icons.water),
        '/nasi': (context) =>
            const RicePage(menuTitle: 'Nasi', icon: Icons.rice_bowl),
        '/sambal': (context) =>
            const SausePage(menuTitle: 'Minum', icon: Icons.hot_tub_sharp),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to Naspad Padang")),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(10.0),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/lauk');
            },
            icon: const Icon(Icons.egg),
            label: const Text("Lauk"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/minum');
            },
            icon: const Icon(Icons.water),
            label: const Text("Minum"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/nasi');
            },
            icon: const Icon(Icons.rice_bowl),
            label: const Text("Nasi"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/sambal');
            },
            icon: const Icon(Icons.hot_tub),
            label: const Text("Sambal"),
          ),
        ],
      ),
    );
  }
}

class LaukPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  const LaukPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 195, 255),
        title: Text(menuTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(icon),
                label: const Text("Kembali"),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              children: [
                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Lauk/rendang.jpg",
                        ),
                      ),
                      const Text("Rendang"),
                      const SizedBox(height: 10),
                      const Text("sadhasdasdjsdjhshbhb"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Lauk/dendeng.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Dendeng"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Lauk/gulai.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Gulai"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Lauk/telur.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Telur"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrinkPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  const DrinkPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 247, 255),
        title: Text(menuTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(icon),
                label: const Text("Kembali"),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              children: [
                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Minum/cendol.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Cendol"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Minum/esteh.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Esteh"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Minum/kopi.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Kopi"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/Lauk/telur.jpg",
                          width: 255,
                          height: 255,
                        ),
                      ),
                      const Text("Telur"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RicePage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  const RicePage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menuTitle)),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(icon),
              label: const Text("Kembali"),
            ),
          ),

          Expanded(
            child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
          ))
        ],
      ),
    );
  }
}

class SausePage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  const SausePage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menuTitle)),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(icon),
          label: const Text("Kembali"),
        ),
      ),
    );
  }
}
