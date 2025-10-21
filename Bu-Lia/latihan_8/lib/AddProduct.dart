import 'package:flutter/material.dart';
import 'package:latihan_8/ProductPage.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama_product = TextEditingController();
  TextEditingController price_product = TextEditingController();
  Future _simpan() async {
    final respon = await http.post
    (Uri.parse('http://localhost/PHP/Product_API/create.php'), body:{
      'name_product':nama_product.text,
      'price_product':price_product.text,
    });
    if(respon.statusCode == 200) {
      return true;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah product")),

      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nama_product,
                decoration: InputDecoration(
                  hintText: 'Product name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name product tidak boleh kosong';
                  }
                },
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: price_product,
                decoration: InputDecoration(
                  hintText: 'Product price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Product price tidak boleh kosong';
                  }
                },
              ),


              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _simpan().then((value) {
                      if (value) {
                        final snackBar=SnackBar(
                          content: const Text('Data berhasil disimpan'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Data gagal disimpan'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    );

                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context)=>Productpage(),
                      ), 
                      (Route <dynamic> route)=>false,
                    );
                  }
                },
                child: const Text('Simpan'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
