import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  // runApp(const MyApp());
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,

      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/porsche': (context) => const MenuPage(
          menuTitle: 'Porsche 911 GT3 RS',
          icon: Icons.beach_access,
          imagePath: 'assets/911.jpg',
          description:
              'Ditenagai mesin 4.0L flat-6 naturally aspirated bertenaga 525 PS (386 kW) dan torsi 465 Nm, dengan redline hingga 9.000 rpm. Akselerasi 0–100 km/jam 3,2 detik, kecepatan puncak 296 km/jam. Bobot hanya sekitar 1.450 kg, berkat penggunaan material ringan seperti karbon. Dimensinya 4.572 mm panjang, 1.900 mm lebar, 1.322 mm tinggi, wheelbase 2.457 mm. Konsumsi bahan bakar rata-rata 13,2 L/100 km dengan emisi 299 g CO₂/km.',
        ),
        '/bmw': (context) => const MenuPage(
          menuTitle: 'BMW M4 Competition',
          icon: Icons.terrain,
          imagePath: 'assets/bmw.jpg',
          description:
              'Dibekali mesin 3.0L inline-6 twin-turbo (M TwinPower Turbo) dengan tenaga 510 hp (375 kW) dan torsi 650 Nm pada 2.750–5.500 rpm. Akselerasi 0–100 km/jam 3,9 detik, kecepatan puncak 250 km/jam (dibatasi elektronik). Bobot sekitar 1.725–1.800 kg tergantung varian. Dimensinya 4.801 mm panjang, 1.887 mm lebar, 1.397 mm tinggi. Konsumsi bahan bakar rata-rata 9,8–10,3 L/100 km dengan emisi 220–230 g CO₂/km.',
        ),
        '/ferrari': (context) => const MenuPage(
          menuTitle: 'Ferrari LaFerrari',
          icon: Icons.museum,
          imagePath: 'assets/ferrari.jpg',
          description:
              'Hiper-mobil hibrida dari Ferrari dengan mesin V12 6,3 L naturally aspirated + motor listrik (sistem HY-KERS). Total tenaga gabungan mencapai 963 PS dan torsi sekitar 900 Nm. Mesin V12 sendiri menghasilkan ± 800 PS pada 9.000 rpm dan torsi 700 Nm pada 6.750 rpm, sementara motor listrik menambah sekitar 163 PS',
        ),
        '/rr': (context) => const MenuPage(
          menuTitle: 'Rolls Royce Phantom',
          icon: Icons.restaurant,
          imagePath: 'assets/rr.jpg',
          description:
              'Ditenagai mesin V12 6.7L twin-turbo bertenaga 563 hp dan torsi 900 Nm, dipadukan dengan transmisi otomatis 8-percepatan RWD. Akselerasi 0–100 km/jam 5,1 detik, kecepatan puncak 250 km/jam (dibatasi). Dimensinya 5.842 mm panjang, 1.990 mm lebar, 1.638 mm tinggi, dengan wheelbase 3.570 mm dan bobot sekitar 2.560 kg. Konsumsi bahan bakar rata-rata 4,4 km/L (kota) dan 9,8 km/L (tol).',
        ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), 
        centerTitle: true,
        title: const Text('Pilih mobil anda'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(10.0),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/porsche');
            },
            icon: const Icon(Icons.car_rental_rounded),
            label: const Text('Porsche'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/bmw');
            },
            icon: const Icon(Icons.car_rental_rounded),
            label: const Text('BMW'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/ferrari');
            },
            icon: const Icon(Icons.car_rental_rounded),
            label: const Text('Ferrari'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/rr');
            },
            icon: const Icon(Icons.car_rental_rounded),
            label: const Text('Rolls Royce'),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  final String imagePath;
  final String description;

  const MenuPage({
    super.key,
    required this.menuTitle,
    required this.icon,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 51, 255),
        title: Text(menuTitle)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 112, 51, 255), // Warna atas (ungu muda)
              Color.fromARGB(255, 180, 151, 218), // Warna tengah
              Color.fromARGB(255, 255, 255, 255), // Warna bawah
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    height: 290,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                menuTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 175, 84, 84),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 51, 255), 
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
