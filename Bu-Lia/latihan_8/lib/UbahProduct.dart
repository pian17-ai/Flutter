import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_8/HalamanProduct.dart';

class UbahProduk extends StatefulWidget {
  final Map Listdata;
  const UbahProduk({Key? key,required this.Listdata}):super(key:key);

  @override
  State<UbahProduk> createState() => _UbahProdukState();
}

class _UbahProdukState extends State<UbahProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id_product = TextEditingController();
  TextEditingController name_product = TextEditingController();  
  TextEditingController price_product = TextEditingController();  

  Future _ubah() async{
    final respon= await http.post(Uri.parse('http://localhost/PHP/Product_API/edit.php'), body: {
      'id_product':id_product.text,
      'name_product':name_product.text,
      'price_product':price_product.text,
    });
    if (respon.statusCode==200){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    id_product.text = widget.Listdata['id_product'];
    name_product.text = widget.Listdata['name_product'];
    price_product.text = widget.Listdata['price_product'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah produk'),
      ),
      body:Form(
        key: formKey,
        child: Container(
          padding:EdgeInsets.all(20),
          child: Column(
          children: [
            TextFormField(
            controller:name_product,
            decoration: InputDecoration(
              hintText: 'nama_produk',
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
              validator: (value){
                if(value!.isEmpty){
                  return 'Nama produk tidak boleh kosong';
                }
                return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
            controller: price_product,
            decoration: InputDecoration(
              hintText: 'harga_produk',
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
              validator: (value){
                if(value!.isEmpty){
                  return 'Harga produk tidak boleh kosong';
                }
                return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed:(){
                if (formKey.currentState!.validate()){
                  _ubah().then((value){
                    if(value){
                      final snackBar = SnackBar(
                        content: const Text('Data berhasil dirubah'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else{
                      final snackBar = SnackBar(
                        content: const Text('Data gagal dirubah'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                  //navigasi setelah data dirubah,kembali ke halaman produk
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context) => HalamanProduk(),
                    ),
                    (Route <dynamic> route)=>false,
                    );
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}