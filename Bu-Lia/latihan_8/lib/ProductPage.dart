import 'dart:convert';
import 'package:flutter/material.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index)) {
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
                )
              },
              child:ListTile(
                title:Text(_listdata[index]['name_product'].toString()),
                subtitle: (_listdata[index]['price_product']),
                trailing :IconButton(
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
                ),
                icon:Icon(Icons.edit),
                  }
                )
              )
            )
          )
        }
      ),
  floatingActionButton: floatingActionButton(
    child:Text(
      '+',
      style:TextStyle(fontSize:20)
    ),
    onPressed() {
      Navigator.push(
        context, MaterialPageRoute(builder:
          (context)=>AddProduct()
        )
      );
    }
  ),,
    );
  }
}