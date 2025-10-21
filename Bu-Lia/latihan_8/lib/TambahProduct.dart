import 'package:flutter/material.dart';
import 'package:latihan_8/HalamanProduct.dart';
import 'package:http/http.dart' as http;


class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name_product = TextEditingController();
  TextEditingController price_product = TextEditingController();  

  Future _simpan() async{
    final respon = await http.post
    (Uri.parse('http://localhost/PHP/Product_API/create.php'), body:{
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk'),
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
                  _simpan().then((value){
                    if(value){
                      final snackBar = SnackBar(
                        content: const Text('Data berhasil disimpan'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else{
                      final snackBar = SnackBar(
                        content: const Text('Data gagal disimpan'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                  //navigasi setelah data disimpan,kembali ke halaman produk
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context) => HalamanProduk(),
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