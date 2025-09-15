import 'package:flutter/material.dart';

void main() {
  runApp(const PageApp());
}

class PageApp extends StatelessWidget {
  const PageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 230, 238),
            leading: const Icon(Icons.home),
            title: Text("Show Image"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.archive),
                  Text("New Article",
                      style: TextStyle(fontWeight: FontWeight.w900))
                ]),
                
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://cdn.antaranews.com/cache/1200x800/2022/06/20/Logo-Baru-Free-Fire.jpg",
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const Text("Free Fire")
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://www.ligagame.tv/images/Aset-Ligagame-IES-VCC_2064f.jpg",
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const Text("Free Fire")
                    ],
                  ),
                ),

                Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://i0.wp.com/www.lapakgaming.com/blog/id-id/wp-content/uploads/2024/10/kode-redeem-ff-3-oktober-2024.jpg?fit=1200%2C675&ssl=1",
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const Text("Free Fire")
                    ],
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
