import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_8/TambahProduct.dart';
import 'package:latihan_8/UbahProduct.dart';
import 'package:latihan_8/DetailProduct.dart';

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
List _listdata = [];
bool _loading = true;

Future _getData() async{
  try {
    final respon = 
    await http.get(Uri.parse('http://localhost/PHP/Product_API/read.php'));
    if (respon.statusCode == 200){
      final data = jsonDecode(respon.body);
      setState(() {
        _listdata = data;
        _loading = false;
      });
     } 
     } catch (e) {
      print(e);
     }
}

// Future<void> _deleteProduk(String idProduk) async {
//   try{
//     final respon=
//     await http.post(Uri.parse('http://localhost/fayola/delete.php'), body:{
//       'id_produk':idProduk,
//     });
//     if (respon.statusCode==200){
//       setState((){
//         _listdata.removeWhere((item) => item['id_produk'] == idProduk);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content:Text('Produk berhasil berhapus')),
//         );
//     } else{
//       throw Exception('Gagal menghapus produk');
//     }
//   } catch (e){
//     print(e);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Terjadi Kesalahan')),
//       );
//   }
// }

void initState(){
  _getData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Produk'),
        backgroundColor: Colors.pink,
      ),
      body:_loading 
      ?Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          return Card(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProduk(
                      Listdata:{
                        'id_product': _listdata[index]
                        ['id_product'],
                        'name_product':_listdata[index]
                        ['name_product'], 
                        'price_product':_listdata[index]
                        ['price_product'],
                      },
                    )));
              },
              child:ListTile(
                title:Text(_listdata[index]['name_product'].toString()),
                subtitle: Text (_listdata[index]['price_product']),
                trailing :IconButton(
                  onPressed: (){
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UbahProduk(
                      Listdata:{
                        'id_product': _listdata[index]['id_product'],
                        'name_product':_listdata[index]['name_product'], 
                        'price_product':_listdata[index]['price_product'],
                      },
                    )));
              },
              icon: Icon(Icons.edit),
                ),
              ),
            ),
          );
        }),
    ),
     floatingActionButton: FloatingActionButton(
      child:Text(
        '+',
        style:TextStyle(fontSize:20),
      ),
      onPressed: (){
        Navigator.push(
          context,MaterialPageRoute(builder: (context) => TambahProduk()));
      },
     ),
    );
  }
}