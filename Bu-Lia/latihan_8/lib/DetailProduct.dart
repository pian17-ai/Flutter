import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  final Map Listdata;
  const DetailProduk({Key? key, required this.Listdata}):super(key:key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
final formKey = GlobalKey<FormState>();
  TextEditingController id_product = TextEditingController();
  TextEditingController name_product = TextEditingController();  
  TextEditingController price_product = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    id_product.text = widget.Listdata['id_product'];
    name_product.text = widget.Listdata['name_product'];
    price_product.text = widget.Listdata['price_product'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Id_produk'),
              subtitle: Text(widget.Listdata['id_product']),
            ),
            ListTile(
              title: Text('Nama_Produk'),
              subtitle: Text(widget.Listdata['name_product']),
            ),
            ListTile(
              title: Text('Harga_Produk'),
              subtitle: Text(widget.Listdata['price_product']),
            ),
          ],
        ),
      ),
    );
  }
}