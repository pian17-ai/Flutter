import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true, // penting biar ukuran layar menyesuaikan
      builder: DevicePreview.appBuilder, // builder dari DevicePreview
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: "Nagigation Menu",
      home: HomePage(),
      routes: {
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
        '/gallery': (context) => GalleryPage(),
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
        title: const Text("Alpihan - Beranda"),
        backgroundColor: const Color.fromARGB(255, 247, 187, 255),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 187, 255),
              ),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.black54, fontSize: 25),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Info"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Contact me"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/gallery');
              },
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FOTO DI ATAS
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/kitty.jpg'),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Welcome to my Apps!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 92, 0, 110),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Prikitiw",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About me"),
        backgroundColor: const Color.fromARGB(255, 247, 187, 255),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            color: const Color.fromARGB(255, 253, 236, 255),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person, size: 50, color: Colors.purple),
                  SizedBox(height: 10),
                  Text(
                    "About me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nama: Alvian Cahyo Pambudi\nUmur: 16 Tahun\nAsal: Indonesia",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: const Color.fromARGB(255, 253, 236, 255),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.computer, size: 50, color: Colors.purple),
                  SizedBox(height: 10),
                  Text(
                    "Operating System",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "🐧 EndeavourOS\n 💻 Kali Linux\n🪟 Windows 11",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: const Color.fromARGB(255, 253, 236, 255),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.web, size: 50, color: Colors.purple),
                  SizedBox(height: 10),
                  Text(
                    "Bidang: Web Development",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Membuat website menggunakan HTML, CSS, JS, Laravel, dan React.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: const Color.fromARGB(255, 253, 236, 255),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.precision_manufacturing,
                    size: 50,
                    color: Colors.purple,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bidang: Robotics",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Mempelajari Arduino, sensor, motor, dan logika robotik.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: const Color.fromARGB(255, 253, 236, 255),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.security, size: 50, color: Colors.purple),
                  SizedBox(height: 10),
                  Text(
                    "Bidang: Offensive Security",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Belajar penetration testing, exploit, dan ethical hacking.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact me"),
        backgroundColor: const Color.fromARGB(255, 247, 187, 255),
      ),
      body: MyForm(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {
        "path": "assets/gallery/birds.jpg",
        "title": "Bird"
      },
      {
        "path": "assets/gallery/giraffe.jpg",
        "title": "My Desk Setup"
      },
      {
        "path": "assets/gallery/horse.jpg",
        "title": "Horfish"
      },
      {
        "path": "assets/gallery/miaw.jpg",
        "title": "Miaw"
      },
      {
        "path": "assets/gallery/mndi.jpg",
        "title": "DPR"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        backgroundColor: const Color.fromARGB(255, 247, 187, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final image = images[index];
            return Card(
              color: const Color.fromARGB(255, 253, 236, 255),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        image["path"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      image["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 92, 0, 110),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// class GalleryPage extends StatelessWidget {
//   const GalleryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> images = [
//       // {
//       //   "path": "assets/my/tes.jpg",
//       //   "title": "Wow"
//       // },
//       {
//         "path": "assets/my/tess.jpg",
//         "title": "<3"
//       },
//       {
//         "path": "assets/my/tessss.jpg",
//         "title": "Jihannn"
//       },
//       {
//         "path": "assets/my/tesssss.jpg",
//         "title": "Jihannn"
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Gallery"),
//         backgroundColor: const Color.fromARGB(255, 247, 187, 255),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           itemCount: images.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             final image = images[index];
//             return Card(
//               color: const Color.fromARGB(255, 253, 236, 255),
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius:
//                           const BorderRadius.vertical(top: Radius.circular(15)),
//                       child: Image.asset(
//                         image["path"]!,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       image["title"]!,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 92, 0, 110),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messagesController = TextEditingController();

  String _email = "";
  String _message = "";

  void _submitData() {
    setState(() {
      _email = _emailController.text;
      _message = _messagesController.text;
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
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "your email",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _messagesController,
            decoration: InputDecoration(
              labelText: "messages",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(onPressed: _submitData, child: Text("Send")),

          SizedBox(height: 20),

          // Text(
          //   _email.isEmpty ? '' : 'Email:$_email',
          //   style: TextStyle(fontSize: 20),
          // ),

          // SizedBox(height: 20),

          // Text(
          //   _kelas.isEmpty ? '' : 'Kelas:$_kelas',
          //   style: TextStyle(fontSize: 20),
          // ),

          // SizedBox(height: 20),

          // Text(_umur < 1 ? '' : 'Umur:$_umur', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
