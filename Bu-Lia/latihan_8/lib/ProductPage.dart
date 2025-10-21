import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_8/AddProduct.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
List _listdata = [];
bool _loading = true;

Future _getData() async {
  try {
    final respon = 
      await http.get(Uri.parse('http://localhost/PHP/Product_API/read.php'));
    if (respon.statusCode == 200) {
      final data = jsonDecode(respon.body);
      setState(() {
        _listdata = data;
        _loading = false;
      });
    }
    else {
    throw Exception('Product gagal dihapus');
  }
  }  catch (e) {
    print(e);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: content)
    // )
  }
}

Future<void> _deleteProduct(String idProduct) async {
  try {
    final respon = 
    await http.post(Uri.parse('http://localhost/PHP/Product_API/delete.php'), body: {
      'id_product': idProduct,
    });

    if (respon.statusCode == 200) {
      setState(() {
        _listdata.removeWhere((item) => item['id_product'] == idProduct);
      });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text('Product berhasil dihapus')),
    );

    } else {
      throw Exception('Product gagal dihapus');
    }
  } catch (e) {
    print(e);
  }
}

void initState() {
  _getData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
        backgroundColor: Colors.lightBlue,
      ),
      body: _loading
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>DetailProduct(
                      ListData: {
                        'id_product': _listdata[index]['id_product'],
                        'name_product': _listdata[index]['name_product'],
                        'price_product': _listdata[index]['price_product'],
                      },
                    )
                  )
                );
              },
              child:ListTile(
                title:Text(_listdata[index]['name_product'].toString()),
                subtitle: (_listdata[index]['price_product']),
                trailing: IconButton(
                  onPressed:(){
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>DetailProduct(
                      ListData: {
                        'id_product': _listdata[index]['id_product'],
                        'name_product': _listdata[index]['name_product'],
                        'price_product': _listdata[index]['price_product'],
                      },
                    )
                  )
                );
                  },
                icon:Icon(Icons.edit),
                )
              )
            )
          );
        }
      ),
      ),
  floatingActionButton: FloatingActionButton(
    child:Text(
      '+',
      style:TextStyle(fontSize:20),
    ),
    onPressed:() {
      Navigator.push(
        context, MaterialPageRoute(builder:
          (context)=>AddProduct()
        )
      );
    }
  ),
    );
  }
}